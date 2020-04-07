"embrace error and uncertainty"

https://en.wikipedia.org/wiki/Live_coding

# Sonic pi

https://en.wikipedia.org/wiki/Sonic_Pi

I was able to install and start using this pretty much instantaneously on MX Linux, here's something I created:

```
use_synth :tri
use_random_seed 23

3.times do
  play rrand(42, 84)
  sample :drum_heavy_kick
  sleep 0.5
  sample :elec_blup
  sleep 0.5
  play rrand(42,84)
  sleep 0.25
end
```

Yikes! Hopefully I get to experiment more.

# Supercollider

I was keen to start using this, but after installing the debian package, I didn't know what to run - there was no reasonable executable I could find to launch the program. Maybe after a restart (?) the binary would show itself, but it was disappointing.

Watch this space

https://en.wikipedia.org/wiki/SuperCollider
https://en.wikipedia.org/wiki/Tidal_(livecoding)

https://en.wikipedia.org/wiki/Algorave


"