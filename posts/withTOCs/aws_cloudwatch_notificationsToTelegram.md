
Table of Contents
=================

   * [What am I trying to do?](#what-am-i-trying-to-do)
   * [Diagram](#diagram)
   * [SNS - Creating a new SNS topic](#sns---creating-a-new-sns-topic)
   * [Cloudwatch - creating a new monitoring event](#cloudwatch---creating-a-new-monitoring-event)
   * [Lambda - sending a message to Telegram](#lambda---sending-a-message-to-telegram)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# What am I trying to do?

Every time I create a new container on AWS ECS, I want the `PublicIp` sent as a
message to my telegram channel.

# Diagram

+----------+  +---+  +------+  +--------+
|Cloudwatch+->+SNS+->+Lambda+->+Telegram|
+----------+  +---+  +------+  +--------+

# SNS - Creating a new SNS topic

We are going to use this service to trigger our Lambda function. We need to make
this first as our Cloudwatch monitoring event requires it to be defined.

Topics -> Create topic -> Name: *toTelegram*

That's it, we don't need to configure anything else.

# Cloudwatch - creating a new monitoring event

I've never really used Cloudwatch before to monitor stuff, but I knew that I'd
need to use it in order to detect a change in my infrastructure. It would be the
trigger that starts the entire process

Events -> Rules -> Create Rule:

For _Event Source_, select _Event Pattern_ and add the following code:
```
{
  "source": [
    "aws.ecs"
  ],
  "detail-type": [
    "ECS Task State Change"
  ],
  "detail": {
    "lastStatus": [
      "RUNNING"
    ]
  }
}
```

For _Targets_, select *SNS topic*, and then the topic that was created
previously, *toTelegram*.


# Lambda - sending a message to Telegram

This is where the meat of what we're trying to do



tags: aws, cloudwatch, sns, lambda