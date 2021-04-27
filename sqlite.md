a single-file database - pretty incredible.

i tried using Couchbase, and it was so resource-intensive I was sickened beyond reproach

# importing text files

(Information harvested from my now deleted git.sr.ht/sqlite repo ~,~)

> You should ideally be reading my post on sqlite for this command, but it's a common enough operation I do I thought I'd include it here

Using the `.import` command with a SQLite import table:

- enter the container
- create a file, e.g. `import_me.txt`
- put your text data into the file
- exit the container
- attach to the container, you should be at the sql> prompt
- run `.import --ascii /root/import_me.txt import` (you can also use `--csv`)

then you can copy the column contents of this import table to the target column:

	instructions go here!
	
# backups and restore

	If you ever need to, you can archive an entire SQLite database by converting it into [ASCII](https://en.wikipedia.org/wiki/ASCII) text and then pipe that into something like [Gzip](https://en.wikipedia.org/wiki/Gzip).

		$ sqlite3 my\_database .dump | gzip -c > my\_database.dump.gz

	That will contain everything you need to reconstruct the database at a later time. To reconstruct the database, you just type:

		$ zcat my\_database.dump.gz | sqlite3 my\_database

via https://unixsheikh.com/articles/sqlite-the-only-database-you-will-ever-need-in-most-cases.html

# see also

A great article on SQLIte
https://news.ycombinator.com/item?id=26816954 -> https://unixsheikh.com/articles/sqlite-the-only-database-you-will-ever-need-in-most-cases.html

https://litestream.io/

https://git.sr.ht/~aaronkelly/litestream