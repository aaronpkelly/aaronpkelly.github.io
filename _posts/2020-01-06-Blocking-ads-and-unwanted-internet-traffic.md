---
title: Blocking ads and unwanted internet traffic
description: How I block all unwanted internet traffic to every device in my home
date: 2020-01-06
tags:
  - dns
  - dhcp
  - ublock
  - pi-hole
---

# Blocking ads and unwanted internet traffic
I hate advertising. I like blocking things. I previously was using [UBlock](https://github.com/gorhill/uBlock) and it was fantastic. However, it works at the browser level, and I sometimes feel that I'm interacting with it more than I should be.

There are other options that manage blocking for you. [pi-hole](https://github.com/pi-hole/pi-hole) is another software/hardware DNS sinkhole that filters out network traffic from unwanted domains, and it worked very well also. However it did end up being another device to manage, and I found I always wanted to poach the pi for running another project :)

Moving further up the chain... there is a cloud solution that I heard good things about, [NextDNS](https://github.com/nextdns/nextdns), which uses DNS to block network requests locally, or at the router level. Here are some descriptions of it:

- “NextDNS allows you to control and monitor your DNS queries. Think Pi-hole on the cloud. I'm impressed by the high quality of their work. I found it specially useful to learn of what services my phone talks to without me realizing.“

- "Yes. NextDNS is a validating DNSSEC resolver. This means that for domains implemeting DNSSEC, NextDNS will cryptographically ensure that the response provided matches the intended response of the domain operator. If the validation fails, NextDNS will return an empty answer."

# Pi-hole
I mant the Pi-hole to be my first line of defence. It has a powerful admin console, many community blocklists, and the ability to work on any device that connects to my home WIFI router.

## Blocklists

### Steven Black

Steven Black, this guy is sound: https://github.com/StevenBlack/hosts

i use his biggest blocklist: - https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts

you may find you have to WHITELIST many sites on Pi-Hole after applying that blocklist, but I don't mind doing that

### Developer Dan

Developer Dan, top bloke: https://www.github.developerdan.com/hosts/

He doesn't have a combined list, so I use all his lists. I even use his most aggressive list, and I have no problems with it

## my current whitelist

`(\.|^)whatsapp\.com$`

`(\.|^)instagram\.com$`

`(\.|^)cdninstagram\.com$`

## my current blacklist
`(\.|^)enthusiast\.gg$`



## Filtering tricky same-domain ads (e.g. Youtube)

Some domains serve ads from the same domain, which makes them very difficult to detect and block at the DNS level. Youtube is an example of this.

I previously had a script running on the pi that attempts to discover and create a blocklist - youtube.update.sh. I got it from this thread: https://discourse.pi-hole.net/t/youtube-script-seems-to-be-working-very-well/

Initially, the script wasn't working, but it's because I wasn't running it as root.

/etc/crontab:
```
* * * * * root sh /usr/local/bin/youtube.update.sh 2>&1
```

I then created an empty file at `/etc/hosts.youtube` and made sure the cronjob wrote to it:
```
$ tail -F /etc/hosts.youtube
tail: '/etc/hosts.youtube' has been replaced;  following new file
74.125.168.6 r1.sn-q0c7rn76.googlevideo.com
74.125.168.6 r1.sn-q0cedn7s.googlevideo.com
74.125.168.6 r2.sn-q0cedn7s.googlevideo.com
74.125.168.6 r3.sn-q0c7rn76.googlevideo.com
74.125.168.6 r3.sn-q0cedn7s.googlevideo.com
74.125.168.6 r4.sn-25glenez.googlevideo.com
74.125.168.6 r4.sn-5hne6nsr.googlevideo.com
74.125.168.6 r4.sn-q0c7rn76.googlevideo.com
74.125.168.6 r4.sn-q0cedn7s.googlevideo.com
74.125.168.6 r5.sn-aigl6nl7.googlevideo.com
74.125.168.6 r5.sn-q0c7rn76.googlevideo.com
74.125.168.6 r5.sn-q0cedn7s.googlevideo.com
74.125.168.6 r6.sn-5hnednlk.googlevideo.com
74.125.168.6 r6.sn-ab5sznl7.googlevideo.com
74.125.168.6 r6.sn-q4f7sn7k.googlevideo.com
```

I don't use this script anymore, because I find the blocklists I use above do a good enough job already, but you may want to check it out

# ublock filters

## dev-filter (remove copycat sites)

https://news.ycombinator.com/item?id=30374905 -> https://github.com/quenhus/uBlock-Origin-dev-filter

## web annoyances ultralist

https://github.com/yourduskquibbles/webannoyances -> https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt


# Using alternative sites
There's no need for ad-blocking if your site doesn't serve ads at all!

## youtube alternative

### invidio.us

Using HTTPS Anywhere + rulesets to redirect youtube links to invidio.us
Yes: https://listed.to/p/Uwjy6IDG6x

## instagram alternatives
### bibliogram.art