---
title: AppImage, Flatpak and Snap
description: Running self-contained Linux apps using AppImage, Flatpak and Snap
date: 2020-05-28
tags:
  - appimage
  - flatpak
  - snap
---

# AppImage, Flatpak and Snap
All dependencies are bundled inside the file.

Alternative to docker, package manager

## AppImage
https://en.wikipedia.org/wiki/AppImage

+ download, chmod +x, then run
+ seems to be the most widely accepted app distribution method
- weird sandboxing issues requires me to run with `--no-sandbox` (maybe this just affects obsidian.md)

A good example: https://obsidian.md/

## Flatpak
+ flatpak has a cli which can be useful, search for new packages on 'flathub'
- hard to remember the command to "run" an application, usually have to type `flatpak list` first to get the package name, then type `flatpak run <package-name>`
- got some negative press over its sandbox security

### nixos setup

https://flatpak.org/setup/NixOS

	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## Snaps

- Require a 'snap store' to be installed on your system
- unpopular due to Canonical's dark pattern of silently redirecting `apt-get install <package>` to install snaps from their snap store