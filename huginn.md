# about

https://github.com/huginn/huginn

> Huginn is a system for building agents that perform automated tasks for you online. They can read the web, watch for events, and take actions on your behalf. Huginn's Agents create and consume events, propagating them along a directed graph. Think of it as a hackable version of IFTTT or Zapier on your own server. You always know who has your data. You do.

I want to talk about my experience with running Huginn, running a short-lived
instance on https://labs.play-with-docker.com, and the installing and configuring
a permanent instance of ECS.

TODO: Any information in this article that is GENERIC to ECS should be moved to
the deployingADockerImageToECS article



# Trying it out

I went to https://labs.play-with-docker.com/ and issued the following command:

```
docker run --rm -it -p 3000:3000 huginn/huginn
```

After a few seconds, the port opened and was clickable - I was able to login
with the default image user/pass `admin/password`. It worked!

From a previous session, I exported a scenario file into JSON. I put this JSON
file into a bucket, made it public, then imported inside the Huginn app. Worked
great. You could equally point to a file on pastebin or gist.

# AWS ECS

## How I use it

The broad strokes:

- The standard container at https://hub.docker.com/r/huginn/huginn is published to AWS ECR
- All of the configuration values in this file can be overridden by ENV vars: https://github.com/huginn/huginn/blob/master/.env.example
- ENV vars are stored in AWS SSM and passed into container on startup
- My exported scenarios live in an S3 bucket which is read at startup

## The container definition

### Environment variables

Any UPPERCASE string in the _.env.example_ file can be overridden by passing in
an environment variable into the container with the same name.

The following environmental variables all deal with email, and are all essential
for allowing my container to send email successfully:
```
DEFAULT_SCENARIO_FILE=https://container-huginn.s3-eu-west-1.amazonaws.com/aaron_huginn_scenario_forexport-1.json
EMAIL_FROM_ADDRESS=aaronkelly@fastmail.com
SEND_EMAIL_IN_DEVELOPMENT=true
SMTP_DOMAIN=fastmail.com
SMTP_ENABLE_STARTTLS_AUTO=false
SMTP_PASSWORD=APP_SPECIFIC_PASSWORD
SMTP_PORT=465
SMTP_SERVER=smtp.fastmail.com
SMTP_USER_NAME=aaronkelly@fastmail.com
```

I was having trouble with getting the application to send email, and I could see
on the webpage for my email provider that they provided an alterntive port
number for mail clients that only supported STARTTLS, so I decided to try it:
experiment with the below variables:
```
SMTP_PORT=587
SMTP_ENABLE_STARTTLS_AUTO=TRUE
```
I also experimented with these, but they caused me problems, so I removed them:
HUGINN_DO_NOT_CREATE_DATABASE
HUGINN_DO_NOT_SEED

## Persistent storage

As AWS Fargate doesn't support persistent storage, I use the
`DEFAULT_SCENARIO_FILE` environment variable to read my exported scenarios from
a S3 bucket.

### My initial attempt at mounting storage (not successful)

I needed to mount a persistent storage volume, and the docs at
https://registry.hub.docker.com/r/huginn/huginn told me how, but I knew it
probably wouldn't work. There are a few examples of how to link a persistent
database to the container, the easiest method being the following:
```
If you do not link a database container, a built-in mysql database will be
started. There is an exported docker volume of /var/lib/mysql to allow
persistence of that mysql database.
```

So all i need to do is link a docker volume to `/var/lib/mysql`, and my
container should live on between restarts!

Task definition -> Volumes -> Add volume: huginn_mysql
Then, Container Definition -> Mount points -> Add volumes -> huginn_mysql

If I was running this container on EC2, with these settings I should have
persistent storage. However, because I'm running it on Fargate, the data is not
persisted.

## Redeploying the new task definition

It's important to always make sure that your cluster is running with the most
recent version of your task definition.

Cluster -> huginn_cluster -> Click on running service -> Update -> Revision: _select latest_

Force new deployment: *TRUE*

Wait for a new task to be provisioned, and then grab the public IP as soon as it
appears. Once the website is ready, log in and make some changes. Now you're
ready to check if these changes are being persisted to your volume by killing
the container and restarting it!

Go to your cluster -> Tasks -> select the task -> click _Stop_

Due to your service having set the desired count of containers to `1`, a new
task will be started soon. If all goes well, you should see that upon logging back in to the
container, that your data was saved successfully.

tags: huginn, automation, aws, docker, ecs, ecr

# see also

[[cron]]