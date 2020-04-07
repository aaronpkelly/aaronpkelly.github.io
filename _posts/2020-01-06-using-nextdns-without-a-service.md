---
title: Using NextDNS without installing a service
description: An example of how to use NextDNS when you are not able to install the daemon as a service
tags:
    - nextdns
    - dns
---

# Using NextDNS Without Installing a Service

I'm currently using a linux distro that doesn't use systemd as an init system, so the typical [installation instructions](https://github.com/nextdns/nextdns#install) will fail at the end when it tries to install the service.

# Download and configure NextDNS settings

Get as much of NextDNS installed and configured as possible. When the installation bombs out at the end, don't worry, you'll still be able to use this configuration when manually starting the daemon.

I used their installer, which detected my distribution automatically:

```
sh -c 'sh -c "$(curl -sL https://nextdns.io/install)"'
```

# Configure network connections to use only NextDNS domain name servers

Disconnect from your network.

Set the IPv4 and IPv6 DNS connections using the values given at https://my.nextdns.io/configuration.

For both IPv4 and IPv6, change the network configuration method to _Automatic, Addresses Only_, in order to ONLY use the domain name servers that you nominate. If you don't choose this, the DNS values you provide will only be considered _Additional DNS servers_, which is not what you want! You want to exclusively use only the values you specify.

Reconnect to your network.

Verify that the DNS servers are configured correctly, I use `nmcli`. It will output a bunch of information about your network adapters, but it's whats printed at the bottom that is of most interest:

```
DNS configuration:
        servers: 45.90.28.11 45.90.30.11
        interface: wlan0

        servers: 2a07:a8c0::f8:aac8 2a07:a8c1::f8:aac8
        interface: wlan0
```

# Starting the NextDNS daemon manually

During the initial installation, NextDNS would have asked you to configure some values, and then it would have saved that config to a file. The NextDNS service would normally have used when starting the daemon but you can do it yourself: 

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

Check that the website also confirms that you're using their service:

![nextdns](/assets/nextdns_allgood.png)