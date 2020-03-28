= Immutable infrastructure

When it comes to using programs, systems and environments... I like determinism. I like reproducability. A phrase I've heard is _immutable infrastructure_ and I really liked that.

= The past - CoreOS

I had a good experience with CoreOS, but I found the rigmarole of generating an Ignition configuration file beforehand in order to securely connect to it was a bit of a headache.

= The present - Fedora CoreOS

I want to try it. I'll still need to write a YAML file, validate it, and transpile it to an _Ignition_ config file, but hopefully the process won't be so foreign to me.

== Installation

I have a crustly old tower PC that I wanted to install it on, so I followed the bare metal instructions [here](https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/). After the ISO failed to copy to the USB key using `dd`, I used the MX Linux Live USB maker to burn the ISO, and it worked perfectly.

The distro offers a LiveUSB mode, and when starting up it initially didn't get past the bootup phase, it seemed to hang. I realised this was because it seemed to expect network connectivity - as soon as I plugged in an ethernet cable and restarted the machine, it brought me straight to the prompt I was expecting.

== Generating an Ignition config

I followed the [docs](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/) to generate an Ignition config. It wasn't too bad, I created a file a YAML file locally and used their container to generate its JSON representation:

```
docker run --rm -i --rm quay.io/coreos/fcct --pretty --strict < ignition_fedoracoreos.config > out.ign
```

I then uploaded this file to an S3 bucket and made the file publically available - I figured this would be the handiest place to host the file.