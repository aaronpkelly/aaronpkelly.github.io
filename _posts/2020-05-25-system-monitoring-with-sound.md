---
title: System monitoring using sound
description: Using sound to give feedback about system health
date: 2020-05-25
tags:
  - audio
---

I first got this idea when Han and Chewie scrambled into the cockpit of the Millennium Falcon and started flipping switches to power on the ship. Along with the lights and cool set pieces coming to life, there was a lot of fun audio feedback they were getting as well.

It got me thinking... could audio be a useful way to get a diagnosis of the current state of a system?

I remember back in the day listening to my magnetic hard disk for the sound of reads an writes when I ran into problems. Silence could be the telltale signs of a crash, furious noise could mean a process was running rampant and blocking everything else.

Ah hell why not!

# Bash?

I wanted to see if I could use simple tools that are already available on my command line. Can linux generate audio using nothing but what ships with a terminal? 

Well... a sine wave can be generated with `speaker-test`. So, I created a bash script that explores this! It's pretty limited though.

[![asciicast](https://asciinema.org/a/6lfNXq6pDQXrr3tMg4IPjZzV0.svg)](https://asciinema.org/a/6lfNXq6pDQXrr3tMg4IPjZzV0)

That was fun.

# The future

Ok so I know FFMPEG can also generate audio...

But I should probably use a language like Python or Rust to do further development :)

# Resources

linuxaudio.org