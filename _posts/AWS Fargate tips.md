tags: #publish #aws

# AWS Fargate notes

# Persistent storage for Fargate tasks

At the moment, there is none. By using Fargate, AWS manages a lot of the
container orchestration for you, but also restricts a lot of functionality.
Persistent storage is not supported.

When first using this service, it was a bit of a shock when I was finally able
to launch a container and begin playing around with my application, however I
realised that as soon I stopped the container, I'd lose everything.

So, make sure that your application supports reading application configuration from
an external URI, and which can read the URI from an environment variable.

## Other possible solutions

Other options for exfiltrating my data from a running container could be:
- examining the application for any way to save my settings to a lightweight file
- examining the application for any sign of an export db to dump file option
- ssh'ing to the running container and syncing the contents of the
`/var/lib/mysql` path to an s3 bucket... interesting. in the task definition,
along with the Huginn container, i would deploy a lightweight alpine container
that allows me to ssh to it. I'd setup both these containers to use a shared
volume mount. I'd then be able to ssh in and upload a backup to S3

tags: aws, fargate, persistence, storage