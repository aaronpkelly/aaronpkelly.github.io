---
title: Creating a webapp with database on Heroku
description:
date: 2020-05-16
categories:
  - webdev
tags:
  - heroku
  - node
  - express
  - postgresql
  - databases
---

# Heroku (and the PEN stack? PostgreSQL/ExpressJS/NodeJS)

I wanted to try Heroku out and see what the platform was like to use.

I also wanted to deploy a webapp with a database, so I was interested to see how hard this would be.

# Setting up Heroku's example nodejs app

I started following this great guide that Heroku offered: https://devcenter.heroku.com/articles/getting-started-with-nodejs

But I got stuck on the final step - database integration. I really wanted to understand this and get this working, as it was the whole point of the exercise!

The following sections deal with me trying to get my nodejs app working with both my local and remote PostgreSQL database.

I really didn't want to have to document this so much, but there may be a future me who runs into this again.

## Establishing a remote database connection (using the Heroku CLI)

This was actually easier to do than connecting to my local database!

I need the psql tool from the `postgres` package to establish a remote connection:

```
sudo apt install postgresql
```

I couldn't connect to my database using `heroku gp:psql`, it just hangs here forever:

```
➜  node-js-getting-started git:(master) heroku pg:psql postgresql-amorphous-12023 --app thawing-savannah-07095
--> Connecting to postgresql-amorphous-12023
```

So I went to https://data.heroku.com/, and got the connection string for my app in _Settings -> Database Credentials -> Heroku CLI_:

```
heroku pg:psql postgresql-amorphous-12023 --app thawing-savannah-07095
```

That didn't give me my user, password, host, dbname... but looking at docs it seems all this can be retrieved with this command (password redacted):

```
➜  node-js-getting-started git:(master) ✗ heroku pg:credentials:url DATABASE
Connection information for default credential.
Connection info string:
   "dbname=d2h0d5h2oencq host=ec2-35-168-54-239.compute-1.amazonaws.com port=5432 user=urnniqueukmgzx password=**** sslmode=require"
Connection URL:
   postgres://urnniqueukmgzx:****@ec2-35-168-54-239.compute-1.amazonaws.com:5432/d2h0d5h2oencq
```

Tried connecting with it:

```
psql --dbname=d2h0d5h2oencq --host=ec2-35-168-54-239.compute-1.amazonaws.com --username=urnniqueukmgzx --password
```

I wasn't able to establish a connection, but this is when something twigged. Could the domain I'm tring to connect to be blacklisted? I use next https://nextdns.io/ to block DNS traffic... and sure enough when I checked, this showed up as a blocked query:

```
ec2-35-168-54-239.compute-1.amazonaws.com
```

After whitelisting it, I was able to connect using the `psql` tool:

```
➜  node-js-getting-started git:(master) ✗ psql --dbname=d2h0d5h2oencq --host=ec2-35-168-54-239.compute-1.amazonaws.com --username=urnniqueukmgzx --password
Password: 
psql (11.7 (Debian 11.7-0+deb10u1), server 12.2 (Ubuntu 12.2-2.pgdg16.04+1))
WARNING: psql major version 11, server major version 12.
         Some psql features might not work.
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

d2h0d5h2oencq=>
```

Also, the super basic Heroku CLI command now worked (and it should have worked at the start!):

```
➜  node-js-getting-started git:(master) ✗ heroku pg:psql                    
--> Connecting to postgresql-amorphous-12023
psql (11.7 (Debian 11.7-0+deb10u1), server 12.2 (Ubuntu 12.2-2.pgdg16.04+1))
WARNING: psql major version 11, server major version 12.
         Some psql features might not work.
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

thawing-savannah-07095::DATABASE=>
```

## Running PostgreSQL locally

Ideally I would have like to have run PostgreSQL as a docker container, but an official image doesn't seem to exist. So I just decided to stick with the one that my package manager provides.

This document https://wiki.debian.org/PostgreSql gives Debian-specific advice for installing and managing PostgreSQL on Debian distros, such as how to setup the database uand users. It also shows how the Debian installation differs from the standard PostgreSQL install, most importantly:

- they've created a wrapper around PostgreSQL's `pg_ctl` command called `pg_ctlcluster`

- the `pg_ctlcluster` wrapper also looks like it runs PostgreSQL's `initdb` command for you, whenever you run a dask to do with database creation 

For all other topics, Debian insist you refer to PostgreSQL's documentation, such as https://wiki.postgresql.org/wiki/First_steps.

### Establishing a local database connection

I was able to get a remote connection to my database on Heroku, but I still had problems with my local app connecting to my local database.

I did initially try following the post-installation prompts after I installed the Debian package, and ran this command:

```
sudo -u postgres pg_ctlcluster 11 main start
```

But the database didn't seem to be setup right. I tried also running these to setup a user:

```
sudo passwd postgres
sudo -u postgres pg_ctlcluster 11 main start
sudo -u postgres createuser aaron
sudo -u postgres createdb aaron
```

But no, didn't feel right. After reading a bit on the internet, on Debian it seemed like installing postgres using apt-get does not automatically an appropriate user role or database - they need to be manually done.

So I decided to start from scratch.

I did find this guide: https://wiki.debian.org/PostgreSql, which looks like a great intro to setting up the db for Debian, so I started running commands:

Drop the current database:

```
pg_dropcluster --stop <version> main
```


```
$ sudo pg_createcluster --start 11 main
[sudo] password for aaron: 
Creating new PostgreSQL cluster 11/main ...
/usr/lib/postgresql/11/bin/initdb -D /var/lib/postgresql/11/main --auth-local peer --auth-host md5
The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.

The database cluster will be initialized with locale "en_IE.UTF-8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

fixing permissions on existing directory /var/lib/postgresql/11/main ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting default timezone ... Europe/Dublin
selecting dynamic shared memory implementation ... posix
creating configuration files ... ok
running bootstrap script ... ok
performing post-bootstrap initialization ... ok
syncing data to disk ... ok

Success. You can now start the database server using:

    pg_ctlcluster 11 main start

Ver Cluster Port Status Owner    Data directory              Log file
11  main    5432 online postgres /var/lib/postgresql/11/main /var/log/postgresql/postgresql-11-main.log
```

At least I understand that a bit more now! An especially interesting part from that message:

```
The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.
```

This is already apparent when I try and run the `psql` command, I need to be the `postgres` user in order to use it:

```
$ psql
psql: FATAL:  role "aaron" does not exist
$ sudo -u postgres bash
[sudo] password for aaron: 
postgres@mx:/home/aaron$ psql
psql (11.7 (Debian 11.7-0+deb10u1))
Type "help" for help.

postgres=# exit
```

Continuing on in the Debian guide, it takes me to a section where I can setup a new user and a database:

```
postgres@mx:/home/aaron$ createuser --pwprompt aaron
postgres@mx:/home/aaron$ createdb -O aaron mylocaldb
```

I also set a password for my user (just in-case):

```
postgres=# ALTER USER aaron WITH PASSWORD 'aaron';
ALTER ROLE
```

When I exit the `postgres` user session go back to my normal `aaron` user, looks like I'm able to login as myself to the database that I created!:

```
psql mylocaldb
psql (11.7 (Debian 11.7-0+deb10u1))
Type "help" for help.

mylocaldb=>
```

But can my local app connect?:

```
$ export DATABASE_URL=postgres://aaron
$ heroku local
[OKAY] Loaded ENV .env File as KEY=VALUE Format
18:17:08 web.1   |  Listening on 5000
18:19:20 web.1   |  Error: connect ETIMEDOUT 45.90.28.0:5432
18:19:20 web.1   |      at TCPConnectWrap.afterConnect [as oncomplete] (net.js:1142:16) {
18:19:20 web.1   |    errno: -110,
18:19:20 web.1   |    code: 'ETIMEDOUT',
18:19:20 web.1   |    syscall: 'connect',
18:19:20 web.1   |    address: '45.90.28.0',
18:19:20 web.1   |    port: 5432
18:19:20 web.1   |  }
```

Oh dear. Is it trying to use invalid connection credentials? After reading https://node-postgres.com/features/connecting, I think my problem was that my `DATABASE_URL` is not sufficient, I've created a database which has diverged from the defaults, so I'd have to set a full connection string:

```
export DATABASE_URL=postgresql://aaron:****@localhost:5432/mylocaldb'
```

Trying that again... starting up my webapp locally and navigating to http://localhost:5000/db, the webpage shows me:

```
Error error: relation "test_table" does not exist
```

Yes! This is what i expect as I haven't created any data in my database yet - but it proves the connection works. Finally! Also, my webapp output much better logs:

```
heroku local
[OKAY] Loaded ENV .env File as KEY=VALUE Format
18:38:23 web.1   |  Listening on 5000
18:38:28 web.1   |  error: relation "test_table" does not exist
18:38:28 web.1   |      at Parser.parseErrorMessage (/home/aaron/src/node-js-getting-started/node_modules/pg-protocol/dist/parser.js:241:15)
18:38:28 web.1   |      at Parser.handlePacket (/home/aaron/src/node-js-getting-started/node_modules/pg-protocol/dist/parser.js:89:29)
18:38:28 web.1   |      at Parser.parse (/home/aaron/src/node-js-getting-started/node_modules/pg-protocol/dist/parser.js:41:38)
18:38:28 web.1   |      at TLSSocket.<anonymous> (/home/aaron/src/node-js-getting-started/node_modules/pg-protocol/dist/index.js:8:42)
18:38:28 web.1   |      at TLSSocket.emit (events.js:315:20)
18:38:28 web.1   |      at addChunk (_stream_readable.js:302:12)
18:38:28 web.1   |      at readableAddChunk (_stream_readable.js:278:9)
18:38:28 web.1   |      at TLSSocket.Readable.push (_stream_readable.js:217:10)
18:38:28 web.1   |      at TLSWrap.onStreamRead (internal/stream_base_commons.js:186:23) {
18:38:28 web.1   |    length: 109,
18:38:28 web.1   |    severity: 'ERROR',
18:38:28 web.1   |    code: '42P01',
18:38:28 web.1   |    detail: undefined,
18:38:28 web.1   |    hint: undefined,
18:38:28 web.1   |    position: '15',
18:38:28 web.1   |    internalPosition: undefined,
18:38:28 web.1   |    internalQuery: undefined,
18:38:28 web.1   |    where: undefined,
18:38:28 web.1   |    schema: undefined,
18:38:28 web.1   |    table: undefined,
18:38:28 web.1   |    column: undefined,
18:38:28 web.1   |    dataType: undefined,
18:38:28 web.1   |    constraint: undefined,
18:38:28 web.1   |    file: 'parse_relation.c',
18:38:28 web.1   |    line: '1180',
18:38:28 web.1   |    routine: 'parserOpenTable'
18:38:28 web.1   |  }
```

I performed the commands given to create the table and data locally as I did previously [using the guide](https://devcenter.heroku.com/articles/getting-started-with-nodejs#provision-a-database):

```
$ psql
psql (11.7 (Debian 11.7-0+deb10u1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

mylocaldb=> create table test_table (id integer, name text);
CREATE TABLE
mylocaldb=> insert into test_table values (1, 'hello database');
INSERT 0 1
mylocaldb=>
```

And after connecting to http://localhost:5000/db, all was well:

```
Database Results
1 - hello database
```

DONE!

# I have no idea what I'm doing
So I've finally got the example app all wired up and working - yay for me! But now I'm faced with trying to understand... what the _fuck_ is going on!? There's a lot of new technologies here and I'm unfamiliar with everything. Apparently this pile of strangeness is called a _software stack_. Here are my initial impressions of each component:

- [[Node.js]]: it's some sort of javascript server and everybody loves it for some reason
- [[Express.js]]: what are you. why do you exist
- [[Angular]]: who are you? WHO DO YOU WORK FOR!?
- [[PostgreSQL]]: oh please Mr Database just let me access you from my webpage

At this point in time, my understanding is better, but you should educate yourself too. But in a nutshell:

www.diagram.codes/d/graph/Node.js-%3EExpress.js%5B%22runs%22%5D%0AExpress.js-%3EHTML%5B%22serves%22%5D

![[creating-a-webapp-with-database-on-heroku_0.png]]

## how I need to change the way I think about this webapp
- my HTML can not directly call server-side node functions
- my HTML can call api endpoints using AJAX (or something) that have been created by express.js

# hacking the planet
I was able to use the example app to _eventually_ work out how to call and use the database, but it wasn't clear to me at the start.

## creating more database data
## passing in multiple objects to the index page
## actually thinking about a database schema omg


# See also
[[Heroku]]

https://wiki.postgresql.org/wiki/First_steps -Additional reading from Postgres wiki