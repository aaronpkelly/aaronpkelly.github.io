Mosh

https://mosh.org

I used it to connect to a VPS on vultr.com

# UDP ports needed

it uses a random UDP port between 60000-61000

on vultr.com, `ufw` is enabled by default on debian images, so i had to disable ufw:

```
root@box $ ufw disable
```

vultr also have _Firewall Groups_, but I didn't need to change anything there

# Locales

This fixed it on vultr.com:

```
apt-get update
apt-get install -y locales
locale-gen "en_US.UTF-8"
update-locale LC_ALL="en_US.UTF-8"
```