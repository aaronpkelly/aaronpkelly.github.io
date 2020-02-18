mpv with hardware decoding allows watching videos at 5% CPU load using the vo=gpu and hwdec=vaapi config settings. audio-channels=2 in mpv seems to give me clearer downmixing to my stereo speakers / headphones than what PulseAudio does by default. A great little feature is exiting with Shift-Q instead of just Q to save the playback location. When watching with someone with another native tongue you can use --secondary-sid= to show two subtitles at once, the primary at the bottom, the secondary at the top of the screen

My wirelss mouse can easily be made into a remote control with mpv with a small ~/.config/mpv/input.conf:

MOUSE_BTN5 run "mixer" "pcm" "-2"
MOUSE_BTN6 run "mixer" "pcm" "+2"
MOUSE_BTN1 cycle sub-visibility
MOUSE_BTN7 add chapter -1
MOUSE_BTN8 add chapter 1