# raspberry piss
## port forwarding
You can use port forwarding on the router to forward a high port number to the ssh port of a
pi on my local network.

e.g. 80.111.144.159:10000 -> 192.168.1.100:22

to generate this high port number, you can multiply the final octet of the local static ip address by the power of 2

e.g. if the local 192.168.1.100, the port number used for forwarding will be:
100^2 = 10000