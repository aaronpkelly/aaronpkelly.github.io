I really like serverless technologies. Like, a lot.

Being able to serve content, or host a useful tool, and letting someone else
worry about managing the servers, is pretty amazing.

# Serverless static website hosting

One morning, I woke up early and started thinking about static website hosting,
don't ask me why. I remember seeing a tutorial somewhere that used AWS S3
buckets for hosting static website content, and public access was then granted
to the bucket. Pretty cool!

There are already some great AWS docs on setting this up, so I don't think I
need to repeat them here. They have a great tutorial on the entire process, but
I only completed this to the end of step 1, as I didn't need to do any advanced
implementation:
[https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/)

And that was it! I was very happy with how easy it was, and how fast the website
was available:
[http://bitserve-test.s3-website-eu-west-1.amazonaws.com/](http://bitserve-test.s3-website-eu-west-1.amazonaws.com/)

I'm going to be experimenting with more HTLM5, CSS and JS on my test website, so
hopefully it looks better by the time you view it!

# Advanced serverless static websites hosting

In the future, maybe I will try:
- finishing the tutorial, so I can implement advanced behaviours on my websites, using serverless backend technologies
- registering a custom domain, and then linking that to my bucket - https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html
