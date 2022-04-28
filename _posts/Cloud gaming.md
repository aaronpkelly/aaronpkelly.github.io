---
title: Cloud gaming
description: Trying out the various cloud gaming services
date: 2020-02-08
tags:
  - gaming
---

# ec2gaming
roll-your-own Windows 10 gaming box

https://github.com/DanielThomas/ec2gaming

and a good (recentish?) guide: https://lg.io/2015/07/05/revised-and-much-faster-run-your-own-highend-cloud-gaming-service-on-ec2.html

# Amazon Luna
https://news.ycombinator.com/item?id=24581799

https://www.amazon.com/luna/landing-page

amazon's own cloud gaming service - similar to ec2gaming

+ streaming
- us only for now


# Google Stadia
+ streams through a browser, no downloads
+ technology worked flawlessly for me
- few games, developers have no incentive to add their games here
- you can't BYO game store. You need to buy games on Stadia. If Stadia dies, your games die

# NVIDIA GeForce Now
I've tried this service on Windows and it's fantastic:
+ streaming client, no downloads
+ BYO games (steam store etc)
+ free 1 hour session per day
+ powerful gaming rig
- supported games only
- need a _very_ good internet connection

# Playstation Now for PC
+ streaming client, no downloads
+ subscription service gives instant access to library
+ works on shadow.tech / paperspace
+ don't need to own a PS, just need a DualShock controller and a PS account
- need a DualShock controller connected
- client is PC only
- starting trial is confusing

https://www.playstation.com/en-us/explore/playstation-now/ps-now-on-pc/

If starting the 7 day trail, it needs to be activated via the PS Store, you also need to be in the correct region (e.g. IE). Restart the client and you should see the 'Getting Started' text under a game change to 'Start'

List of all PS Now games: https://www.playstation.com/en-us/ps-now/ps-now-games/#all-ps-now-games

# XBOX

## XBOX Cloud Gaming (NEED CONTROLLER CONNECTED)

XBOX Game Pass for PC Ultimate subscription:
- €12.99 / month
- you can play through your browser: https://www.xbox.com/en-ie/play

PC Game Pass
- €9.99 / month
- I'm not sure if you can play in your chrome browser

NOTE: MAKE SURE you have a controller connected before you launch the site

## XBOX Game Pass for PC
It's an app, you download the games and play on a PC:
- https://en.wikipedia.org/wiki/Xbox_Game_Pass
- https://www.xbox.com/en-US/xbox-game-pass/pc-games

+ PC subscription service gives access to large library
+ has access to games that you can't get anywhere else, like MS Flight Simulator
- non-streaming client, have to download games
- client is PC only
- doesn't work on fucking PAPERSPACE, because my desktop is running Microsoft Windows Server 2016 Datacenter version `10.0.14393 Build 14393`, and the app detects that its build `1607`, but the XBOX installer knows that build `1909` is available

full list of games: https://www.trueachievements.com/Xbox-Game-Pass/Games

## XBox Cloud Gaming (formerly project XCloud)

It's a streaming client

+ streaming!
+ Windows 10 client via browser app in "early 2021".
+ Invite-only beta for Windows 10 + iOs devices started April 2021
- currently android phones/tablets only

https://en.wikipedia.org/wiki/XCloud

full list of supported games: https://www.trueachievements.com/xcloud/games

# Cloud PCs for gaming
## Shadow
https://shadow.tech/int/

Company name: Blade. From France

+ streaming client
+ beefy Windows 10 rig
- +100% price hikes after bankruptcy, for the same service
- you need to "pre-order" the service, which takes forever to activate

## Paperspace
+ run a Windows 10 gaming machine in the cloud. Use this if you don't have access to Shadow
+ good alternative to get access to game subscription services that only provide PC installers (Playstation Now for PC), or the Battle.net client
+ provides the Paperspace App[0] for optimised streaming
- cannot run XBOX Game Pass for PC because the Parsec public template is Microsoft Windows Server 2016 Datacenter
- can be unintuitive to setup a gaming rig, and there was previously an approval process if you wanted a modern GPU which is a bit annoying (you need to send them a message as to why you want it)

[0]: which is in fact the Pasec client - https://parsecgaming.com/ - low latency screen sharing optimised for game streaming. Use `./Paperspace.sh` to launch, not `./Paperspace`

# Steam Cloud Gaming (TBA)
Valve's cloud gaming service. TBA. Would love to try this
