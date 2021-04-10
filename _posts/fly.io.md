---
title: fly.io
description:
date: 2021-04-10
tags:
  - containers
  - deployment
---

While reading [a post](https://news.ycombinator.com/item?id=26746280) on hacker news I discovered a fantastic new service  - [fly.io](https://fly.io/)!

Here's their description of themselves:

> We’re Fly.io. We take container images and run them on our hardware around the world. It’s pretty neat, and you [should check it out](https://fly.io/docs/speedrun/); with an already-working Docker container, you can be up and running on Fly in well under 10 minutes.

Imagine deploying a _Dockerfile_ (or a public docker image) instantly to the cloud, and have it running in seconds. Too frickin' cool

# trying it out

I have my own [api](https://git.sr.ht/~aaronkelly/api), and it has a Dockerfile to build it:

	FROM python:alpine
	RUN pip3 install \\
		boto3 \\
		flask \\
		pytest \\
		requests
	COPY . /app
	WORKDIR app
	ENTRYPOINT \[ "flask" \]
	CMD \[ "run", "--host", "0.0.0.0" \]

After [installing flyctl](https://fly.io/docs/getting-started/installing-flyctl/), I ran this command inside my git repo:

	$ flyctl init
	Update available 0.0.163 -> 0.0.207
	Update with flyctl version update

	? App Name (leave blank to use an auto-generated name) aaronkelly-api

	Automatically selected personal organization: Aaron Kelly

	? Select builder: Dockerfile
		(Do not set a builder and use the existing Dockerfile)
	? Select Internal Port: 5000
	New app created
	  Name         = aaronkelly-api  
	  Organization = personal        
	  Version      = 0               
	  Status       =                 
	  Hostname     = <empty>         

	App will initially deploy to lhr (London, United Kingdom) region

	Wrote config file fly.toml
	
All that command did was create a `fly.toml` file:

	$ cat fly.toml
	# fly.toml file generated for aaronkelly-fly on 2021-04-10T11:24:42+01:00

	app = "aaronkelly-api"

	kill_signal = "SIGINT"
	kill_timeout = 5

	[[services]]
	  internal_port = 5000
	  protocol = "tcp"

	  [services.concurrency]
		hard_limit = 25
		soft_limit = 20

	  [[services.ports]]
		handlers = ["http"]
		port = "80"

	  [[services.ports]]
		handlers = ["tls", "http"]
		port = "443"

	  [[services.tcp_checks]]
		grace_period = "1s"
		interval = "15s"
		port = "8080"
		restart_limit = 6
		timeout = "2s
		
And I was able to deploy it with `flyctl deploy`:

	$  flyctl deploy
	Update available 0.0.163 -> 0.0.207
	Update with flyctl version update

	Deploying aaronkelly-api
	==> Validating App Configuration
	--> Validating App Configuration done
	Services
	TCP 80 ⇢ 5000 

	Deploy source directory '/home/aaron/src/api'
	Docker daemon available, performing local build...
	==> Building with Dockerfile
	Using Dockerfile Builder: /home/aaron/src/api/Dockerfile
	Step 1/6 : FROM python:alpine
	 ---> ef8f54a83dcd
	Step 2/6 : RUN pip3 install     boto3   flask   pytest  requests
	 ---> Using cache
	 ---> c1c2bf3e1968
	Step 3/6 : COPY . /app
	 ---> Using cache
	 ---> 29dfc594c18a
	Step 4/6 : WORKDIR app
	 ---> Using cache
	 ---> 400567e30a0c
	Step 5/6 : ENTRYPOINT [ "flask" ]
	 ---> Using cache
	 ---> 2f0e33149159
	Step 6/6 : CMD [ "run", "--host", "0.0.0.0" ]
	 ---> Using cache
	 ---> cb367cfaa12d
	Successfully built cb367cfaa12d
	Successfully tagged registry.fly.io/aaronkelly-api:deployment-1618050757
	--> Building with Dockerfile done
	Image: registry.fly.io/aaronkelly-api:deployment-1618050757
	Image size: 130 MB
	==> Pushing Image
	The push refers to repository [registry.fly.io/aaronkelly-api]
	dd7f9666f400: Layer already exists 
	650ae75897db: Layer already exists 
	81a33fccb669: Layer already exists 
	84880d4f10be: Layer already exists 
	9f044ae41f8b: Layer already exists 
	f65ae8cf3a00: Layer already exists 
	8ea3b23f387b: Layer already exists 
	deployment-1618050757: digest: sha256:78dbaee8405b27636ef6f95e50d8a909c72112535186a1a1fa83de0bb882e9b8 size: 1790
	--> Done Pushing Image
	==> Creating Release
	Release v0 created
	Deploying to : aaronkelly-api.fly.dev

	Monitoring Deployment
	You can detach the terminal anytime without stopping the deployment

	1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
	--> v7 deployed successfully

I was able to reach my app immediately:

	$ curl aaronkelly-api.fly.dev     

	### welcome to my api!
	endpoints:
	/cloud      cloud functions
	/dotfiles:  public dotfiles function

My API doesn't have a nice web frontend, but you could try deploying your own webapp or one of the popular images from [https://hub.docker.com/](https://hub.docker.com/). 

Once its deployed, all you need to do then is run `flyctl open`, and the app will open in your browser.