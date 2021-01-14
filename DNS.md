# clearing

this article is good: https://ostechnix.com/how-to-clear-or-flush-dns-cache-in-linux/

## nixos-specific

```
# Nscd DNS caching service
sudo systemctl restart nscd.service

# Bind/Named DNS caching service
sudo systemctl restart named

# Dnsmasq DNS caching service
sudo systemctl restart dnsmasq
```