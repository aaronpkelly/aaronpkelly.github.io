# NextDNS
I tell the Pi-hole to use nextdns.io as a DNS provider. I also use NextDNS's technology and additional blocklists there too. It may be overkill, but, as I said - I really hate ads :)

## Using NextDNS's DNS service without installing their service/daemon

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

## Adding NextDNS records to Pi Hole
You can get a list of DNS queries via the NextDNS's logs tab, but how do you convert the logs on that webpage to a format that's readable by pi-hole? 

Well, I just selected all the text on the webpage (https://my.nextdns.io/f8aac8/logs) and dumped it into a file. So, here is my input file:
```

Setup
Security
Privacy
Parental Control
Blacklist
Whitelist
Analytics
Logs
Settings
googlev

Blocked Queries Only
r3---sn-q0c7rn76.googlevideo.comAAAA
mx
Thursday, June 4, 2020 7:46 PM
r3---sn-q0c7rn76.googlevideo.comA
mx
Thursday, June 4, 2020 7:46 PM
r3-sn-q0c7rn76.googlevideo.comA
mx
Thursday, June 4, 2020 7:26 PM
r1---sn-q0cedn7s.googlevideo.comA
mx
Wednesday, June 3, 2020 11:06 PM
r3---sn-q0c7rn76.googlevideo.comAAAA
37.228.244.125
```

I then made a bash command to filter out only the relevant information, and then for each line:
- do a `nslookup` on each record and print the ip4 address
- on the same line, print the domain name that was queried

```
grep -e '.*---.*comA$' input | uniq | sed 's/A//g' | xargs -n 1 sh -c 'for arg do nslookup "$arg" 2>/dev/null | grep "Address 1" | cut -d " " -f 3 | xargs echo -n; echo " $arg"; sleep 5; done' _
```

Ouput:
```
173.194.129.232 r3---sn-q0c7rn76.googlevideo.com
74.125.168.6 r1---sn-q0cedn7s.googlevideo.com
173.194.129.232 r3---sn-q0c7rn76.googlevideo.com
173.194.55.71 r1---sn-vgqsenls.googlevideo.com
74.125.100.185 r3---sn-5hnedn7z.googlevideo.com
173.194.129.232 r3---sn-q0c7rn76.googlevideo.com
173.194.129.234 r5---sn-q0c7rn76.googlevideo.com
173.194.129.232 r3---sn-q0c7rn76.googlevideo.com
```

I could then add this output to my 

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

## So... I don't have the daemon. What am I missing out on? (INCUBATING)

This section isn't very well explored yet.

I haven't had a chance to explore what the 'NextDNS Open-Source UNIX Client' actually gives me, I haven't been able to install it successfully.

I did try to get as much of NextDNS installed and configured as possible. However the installation bombs out at the end:

```
$ sh -c 'sh -c "$(curl -sL https://nextdns.io/install)"'
<die>
```