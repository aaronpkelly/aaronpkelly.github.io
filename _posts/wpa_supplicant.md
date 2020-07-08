when i'm installing alpine linux on a laptop

i like to put a `wifi.sh` script in the /root folder

```
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
```

wpa_supplicant.conf

```
network={
	ssid="VM4D658AD
	key_mgmt=WPA-PSK
	psk="<PWD>"
}
```

/etc/init.d/networking restart

ip link set eth0 up

udhcpc -i eth0

