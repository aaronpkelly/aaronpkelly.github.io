
Table of Contents
=================

   * [The problem](#the-problem)
   * [The solution](#the-solution)
   * [How to do it](#how-to-do-it)
      * [Dockerfile](#dockerfile)
         * [Insecure Dockerfile](#insecure-dockerfile)
         * [Secure Dockerfile TODO](#secure-dockerfile-todo)
      * [Pushing the Docker image to a registry](#pushing-the-docker-image-to-a-registry)
      * [Launching your image with AWS Fargate](#launching-your-image-with-aws-fargate)
      * [Connecting to your container using SSH](#connecting-to-your-container-using-ssh)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# The problem
AWS Fargate doesn't allow you to SSH into a running container.

# The solution
Install OpenSSH on your container, configure it, then change the port number.

# How to do it
You will need to be familiar with building a Dockerfile, and publishing it to
a Docker registry. In this example, I'm using AWS ECR (Elastic Container
Registry) to push my Docker image to.

## Dockerfile
### Insecure Dockerfile
This method is the fastest, but you will be compromsing security for speed.
You will be using a generated key, disabling password login, and accessing the
container via a public IP address.

Build the below example Dockerfile:

Dockerfile:
```
FROM alpine:latest 
RUN apk update && \ 
    apk add \ 
        openssh \ 
        openrc 
 
RUN rc-update add sshd 
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa 
 
# you can change the port here, or specify it when running sshd 
# RUN sed -i 's/#Port 22/Port 80/g' /etc/ssh/sshd_config 
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config 
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config 
 
RUN addgroup -g 1000 ec2-user && \ 
    adduser -D -h /home/ec2-user -G ec2-user -u 1000 ec2-user 
 
RUN passwd -d root 
RUN passwd -d ec2-user 
ENV HOME /home/ec2-user  
WORKDIR /home/ec2-user 
 
CMD ["/usr/sbin/sshd", "-D", "-p", "80"] 
```

### Secure Dockerfile TODO
There is a way to pull in SSH keys into a container securely, but I haven't
tested this enough.

## Pushing the Docker image to a registry
If you are using AWS ECR, you can use a buildspec.yml file similar to the
below to push to the image to the registry. Make sure to use your own value for
`REPOSITORY_URI`.

buildspec.yml:
```
version: 0.2   
   
phases:   
  install:   
    runtime-versions:   
      java: corretto11   
  pre_build:   
    commands:   
      - echo Logging in to Amazon ECR...   
      - aws --version   
      - $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)   
      - REPOSITORY_URI=YOUR_ECR_IMAGE_URI
      - COMMIT_HASH=$(echo $CODEBUILD_RESOLVED_SOURCE_VERSION | cut -c 1-7)   
      - IMAGE_TAG=${COMMIT_HASH:=latest}   
  build:   
    commands:   
      - echo Build started on `date`   
      - echo Building the Docker image...   
      - docker build -t $REPOSITORY_URI:latest .   
      - docker tag $REPOSITORY_URI:latest $REPOSITORY_URI:$IMAGE_TAG   
  post_build:   
    commands:   
      - echo Build completed on `date`   
      - echo Pushing the Docker images...   
      - docker push $REPOSITORY_URI:latest   
      - docker push $REPOSITORY_URI:$IMAGE_TAG   
```

After the image is pushed, you are now ready to launch your AWS Fargate
cluster, using an image that allows remote SSH logins.

## Launching your image with AWS Fargate
- Go to https://aws.amazon.com/fargate/ and click _Get started with AWS Fargate_
- Click Clusters -> Get Started. Using the Get Started button walks you through
the steps on launching your Docker image on AWS Fargate, and functions as a
little tutorial
- In the _Container defintion_ section, choose _custom_, and then click
_configure_ on the button itself
- Enter the following, leave the rest with the defaults:
Container name: `fargate-ssh`
Image: `YOUR_ECR_IMAGE_URI`
Port mappings: `80`
- Click through to the end and create the cluster 
- The cluster will take a few moments to spin up, and when it's done you can
view it
- Click the cluster name, then click on the name of the service that's running
- Click the task tab and then click the task that is running
- In the Network section, a _Public IP_ would have been generated

![gif](https://aaronpkelly.github.io/posts/resources/aws-fargate-ssh_0.gif)

## Connecting to your container using SSH
Finally, the moment of truth.

If you have built the insecure Docker image, you can connect to your container
with the `ec2-user` or `root` user by simply running this command:
```
ssh ec2-user@YOUR_PUBLIC_IP
```

![gif](https://aaronpkelly.github.io/posts/resources/aws-fargate-ssh_1.gif)

If you have built the secure docker image, TODO
