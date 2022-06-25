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
+ works on Lutris for linux (see instructions below)
	+ but of course you can play it on a VM (shadow.tech / paperspace)
+ don't need to own a PS, just need a DualShock controller and a PS account

Cons:
- need a DualShock controller connected
- client is PC only
- starting trial is confusing

https://www.playstation.com/en-us/explore/playstation-now/ps-now-on-pc/

If starting the 7 day trail, it needs to be activated via the PS Store, you also need to be in the correct region (e.g. IE). Restart the client and you should see the 'Getting Started' text under a game change to 'Start'

List of all PS Now games: https://www.playstation.com/en-us/ps-now/ps-now-games/#all-ps-now-games

## Lutris installation instructions - NOTE: June 18 2022 cannot run :(

Currently you DO need to install the Wine Runner manually.

Do follow the instructions at https://lutris.net/games/playstation-now/ because they may be updated, but here's a script:

E.g.:

	curl -LO https://github.com/GloriousEggroll/proton-ge-custom/releases/download/6.21-GE-2/Proton-6.21-GE-2.tar.gz && \
	tar xvf Proton-6.21-GE-2.tar.gz -C ~/.local/share/lutris/runners/wine/ && \
	mv ~/.local/share/lutris/runners/wine/Proton-6.21-GE-2/files/* ~/.local/share/lutris/runners/wine/Proton-6.21-GE-2




# XBOX

## "XBox Game Pass" subscription model

There's 3 tiers/services:
- Console (need XBox console-only, gives you access to free games)
- PC (PC app, need to download)
- Ultimate (cloud gaming - stream games!)

List of games (PC Games via PC Games Pass, Console games via ULTIMATE pass: https://www.trueachievements.com/Xbox-Game-Pass/Games)

### Console

Who cares

### PC

It's called the "PC Game Pass"

Uses the "Xbox app" (XboxInstaller.exe) to access the service

List of games: https://www.xbox.com/en-US/xbox-game-pass/games (lists both console (via XBOX Cloud Gaming) and PC games)

Pros:
- first 3 months €1, then €9.99/month 
+ PC subscription service gives access to large library
+ free access to the EA Play service (and all their games)
+ has access to games that you can't get anywhere else, like MS Flight Simulator
+ the Xbox app can also be used to stream console games from the XBOX Cloud Gaming service

Cons:
- non-streaming client, have to download games
- client is PC only
- doesn't work on fucking PAPERSPACE, because my desktop is running Microsoft Windows Server 2016 Datacenter version `10.0.14393 Build 14393`, and the app detects that its build `1607`, but the XBOX installer knows that build `1909` is available

Cons:
- It's not a browser app

### ULTIMATE

NOW WE'RE TALKING

- gets you access to XBOX Cloud Gaming (Beta) service (play console games in browser)
	- NEED CONTROLLER CONNECTED before you launch the site for the damn thing to work
- Xbox Game Pass Ultimate membership
	- XBOX Game Pass for PC Ultimate subscription:
	- €12.99 / month
	- you can play through your browser: https://www.xbox.com/en-ie/play



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
