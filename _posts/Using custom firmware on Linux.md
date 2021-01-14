---
title: Using custom firmware on Linux
description: How I updated my Linux distribution's network firmware 
date: 2020-01-12
tags:
  - firmware
categories:
  - linux
---

On my Dell XPS 13 9360, I have the following network adapter:

```
$ lspci | grep Network
3a:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter (rev 32)
```

I noticed though that if it was connected to a 5GHz wireless access point, it would download at a very fast rate, and then completely die.

I think there is a known issue with earlier versions of the firmware for this adapter for both Windows _and_ Linux. Newer versions of the firmware has since become available, but it would take a while to make it into the `linux-firmware` package for my distro (MX Linux).

I found this article:
https://askubuntu.com/questions/929027/qualcomm-atheros-qca6174-802-11ac-wireless-network-adapter-168c003e-rev-32

And although the poster reports that the steps didn't work for him, they absolutely worked for me. A commenter further down provides [this guide](https://www.dell.com/support/article/en-us/sln306440/killer-n1535-wireless-firmware-manual-update-guide-for-ubuntu-systems?lang=en) from Dell which pretty much covers the same steps, but it was nice to have official documentation.

Anyway, I took a risk and replaced the default firmware that comes with my distro - and it paid off. I have screaming fast 5GHz wifi, and so far it's stable. 