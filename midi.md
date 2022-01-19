# timidity (cli)

install

	nix-shell -p timidity freepats

start the ALSA sequencer (not needed every time):

	timidity -iA -B2,8 -Os -EFreverb=0
	
play MIDI:

	timidity
	
use the curses interface:

	timidiy -in Aha*.mid

some docs:

- http://linux-audio.com/TiMidity-howto.html (thank you - a great resource, it's how I got the above commands, and how I got it working on NIXOS)
- https://wiki.archlinux.org/title/Timidity%2B%2B

## soundfonts

currently i'm using freepats, but there are others:

	nix-shell -p fluidsynth soundfont-fluid

# midi collections

https://looptorrent.net/category/midi/ - a site that offers torrents of midi packs
https://sampletorrent.net/2020/02/canary-julz-midi-collection-vol-1-midi/ - another nice torrent collection sites

- https://archive.org/details/themagicofmidiv1 internet archive midi collection (the magic of midi)
- midi-man
	- https://www.reddit.com/r/WeAreTheMusicMakers/comments/3ajwe4/the_largest_midi_collection_on_the_internet/ some guys giant 150,000 SORTED midi collection (use the magnet link)
	- https://www.reddit.com/r/WeAreTheMusicMakers/comments/3anwu8/the_drum_percussion_midi_archive_800k/
	- https://www.reddit.com/r/WeAreTheMusicMakers/comments/3ajwe4/the_largest_midi_collection_on_the_internet/


# cvlc (and vlc)

on nixos, you can use cvlc, but you need a soundfont installed:

	nix-shell -p soundfont-fluid
	
which installs to

	/nix/store/vf4djfi6n8v8qj36rqwfhlsqsg0asxbh-Fluid-3/share/soundfonts/FluidR3_GM2-2.sf2

open vlc -> Preferences -> Search for _Fluidsynth_, and give the above path

now you can play midi on both cvlc and vlc!

use the curses interface:

	cvlc -I curses *.mid