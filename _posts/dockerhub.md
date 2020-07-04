# autobuilds - use dockerhub's infrastructure to build your dockerfiles

After hearing about this feature, I just had to give it a go!

Here's my current deployment pipeline:

Codecommit -> CodePipeline -> Push app to Github repo -> Put app to S3 bucket

As soon as Dockerhub detects a change in a connected repo, it will use ITS OWN
INFRASTRUCTURE to do the builds. This is a pretty cool feature - let them 
do all the overhead of building images, and let me pull the final image.

Proof: 
![Autobuilt image running on EC2](https://aaronpkelly.github.io/posts/resources/docker_dockerhub_autoBuilds.png)