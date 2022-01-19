from #sr.ht.watercooler

netcat + tar + ydddrasil (encryption)


> it essentially gives you a consistent IPv6 address per machine with no NAT that follows you from network to network 


for multiple files

	tar -cv whatever/*.txt | nc -v other.host 12345; nc -vll :: 12345 | tar -xv                                                               

>  @ddevault | tar in general is a good tool for shoving multiple files into a Unix pipe

# drews example of file transfer

	nc -vll :: 12345 > file
	nc -v other.end 12345 < file

	
# see also

https://en.wikipedia.org/wiki/Netcat

https://github.com/yggdrasil-network/yggdrasil-go

https://github.com/schollz/croc

https://github.com/magic-wormhole/magic-wormhole