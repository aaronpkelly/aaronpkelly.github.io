
Table of Contents
=================

   * [The container definition](#the-container-definition)
      * [Environment variables](#environment-variables)
   * [Persistent storage](#persistent-storage)
      * [My initial attempt at mounting storage (not successful)](#my-initial-attempt-at-mounting-storage-not-successful)
   * [Redeploying the new task definition](#redeploying-the-new-task-definition)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



TODO: Any information in this article that is GENERIC to ECS should be moved to
the deployingADockerImageToECS article

I want to talk about how I installed and configured Huginn on AWS.

# The container definition

## Environment variables

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

# Persistent storage

As AWS Fargate doesn't support persistent storage, I use the
`DEFAULT_SCENARIO_FILE` environment variable to read my exported scenarios from
a S3 bucket.

## My initial attempt at mounting storage (not successful)

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

# Redeploying the new task definition

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