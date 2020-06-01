---
title: Blocking ads and unwanted internet traffic
description: How I block all unwanted internet traffic to every device in my home
date: 2020-01-06
tags:
    - nextdns
    - dns
    - ublock
    - pi-hole
---

# Router don't let me DNS

My router doesn't let me set a custom DNS server, which typically is needed in order to point all DNS requests to the pi-hole.

This isn't the end of the world. My router DOES allow me to set a DHCP server... and the pi-hole can use this fact to become a DHCP server, which allows it to then function as a DNS server.

# PiHole

My first line of defence.

I use pi hole with all blocklists enabled.

I tell the Pi-hole to use nextdns.io as a DNS provider. I also use NextDNS's technology and additional blocklists there too. It may be overkill, but I really hate ads.

## Youtube

Some domains serve ads from the same domain, which makes them very difficult to detect and block at the DNS level. Youtube is an example of this.

I have a script running on the pi that attempts to discover and create a blocklist - youtube.update.sh. I got it from this thread: https://discourse.pi-hole.net/t/youtube-script-seems-to-be-working-very-well/31316


# NextDNS



I like blocking things. I'm currently using [UBlock](https://github.com/gorhill/uBlock) and it's fantastic. However, it works at the browser level, and I sometimes feel that I'm interacting with it more than I should be.

There are other options that manage blocking for you. [pi-hole](https://github.com/pi-hole/pi-hole) is another software/hardware DNS sinkhole that filters out network traffic from unwanted domains, and it worked very well also. However it did end up being another device to manage, and I found I always wanted to poach the pi for running another project :)

Moving further up the chain... there is a cloud solution that I heard good things about, [NextDNS](https://github.com/nextdns/nextdns), which uses DNS to block network requests locally, or at the router level. Here are some descriptions of it:

- “NextDNS allows you to control and monitor your DNS queries. Think Pi-hole on the cloud. I'm impressed by the high quality of their work. I found it specially useful to learn of what services my phone talks to without me realizing.“

- "Yes. NextDNS is a validating DNSSEC resolver. This means that for domains implemeting DNSSEC, NextDNS will cryptographically ensure that the response provided matches the intended response of the domain operator. If the validation fails, NextDNS will return an empty answer."

# Using NextDNS's DNS service without installing their service/daemon

I'm currently using a linux distro that doesn't use systemd as an init system, so the typical [installation instructions](https://github.com/nextdns/nextdns#install) will fail at the end when it tries to install the service.

However, it doesn't seem to matter. I found that if I manually configure my network connections using the DNS values provided on https://my.nextdns.io/configuration/f8aac8/setup, it still works. See the next section for how to configure this.

## Configure network connections to use only NextDNS domain name servers

Disconnect from your network.

Set the IPv4 and IPv6 DNS connections using the values given at https://my.nextdns.io/configuration.

For both IPv4 and IPv6, change the network configuration method to _Automatic, Addresses Only_, in order to ONLY use the domain name servers that you nominate. If you don't choose this, the DNS values you provide will only be considered _Additional DNS servers_, which is not what you want! You want to exclusively use only the values you specify.

NOTE: I use Gnome's NetworkManager to manage my WIFI connections, RedHat have some good documentation on IPv4 and IPv6 configuration [here](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ipv4_settings).

Reconnect to your network. You should immediately see that your _/etc/resolv.conf_ is updated with your DNS servers immediately.

Verify that the DNS servers are configured correctly, I use `nmcli`. It will output a bunch of information about your network adapters, but it's whats printed at the bottom that is of most interest:

```
DNS configuration:
        servers: 45.90.28.11 45.90.30.11
        interface: wlan0

        servers: 2a07:a8c0::f8:aac8 2a07:a8c1::f8:aac8
        interface: wlan0
```

You can also go to https://my.nextdns.io/ and it will confirm that you're using their DNS, and that your configuratin is OK:

![nextdns](/assets/nextdns_allgood.png)

# So... I don't have the daemon. What am I missing out on? (INCUBATING)

This section isn't very well explored yet.

I haven't had a chance to explore what the 'NextDNS Open-Source UNIX Client' actually gives me, I haven't been able to install it successfully.

I did try to get as much of NextDNS installed and configured as possible. However the installation bombs out at the end:

```
$ sh -c 'sh -c "$(curl -sL https://nextdns.io/install)"'
<die>
```

## Starting the NextDNS daemon manually

During the initial installation, NextDNS would have asked you to configure some values, and then it would have saved that config to a file. The NextDNS service would normally have used when starting the daemon, but I discovered you can do it yourself: 

```
$ sudo nextdns run --config-file /etc/nextdns.conf
INFO: 18:54:11 Starting NextDNS 1.4.36/linux on localhost:53
INFO: 18:54:11 Listening on TCP/[::1]:53
INFO: 18:54:11 Listening on UDP/127.0.0.1:53
INFO: 18:54:11 Listening on TCP/127.0.0.1:53
INFO: 18:54:11 Listening on UDP/[::1]:53
INFO: 18:54:16 Activating
ERROR: 18:54:16 Activate: NetworkManager resolver management: exit status 1
INFO: 18:54:20 Connected 45.90.28.0:443 (con=40ms tls=180ms, TLS13)
INFO: 18:54:20 Connected 78.141.193.90:443 (con=50ms tls=49ms, TLS13)
INFO: 18:54:20 Switching endpoint: https://vultr-lon-1.edge.nextdns.io#78.141.193.90,2a05:f480:1000:3ee:5400:2ff:fe99:7256
```

