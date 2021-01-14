# ctrl+mouseleft/right/middle
this is how you access the xterm settings, it's slightly shit

# select to clipboard
super important option to enable, allows selected text to be copied to the xclipboard immediately

ctrl + mousemiddle, then enable _Select to Clipboard_

you can also add this to your xterm config file, e.g. (also includes Dracula theme from https://github.com/dracula/xresources):

```
$ cat .Xresources 
! Dracula Xresources palette
*.foreground: #F8F8F2
*.background: #282A36
*.color0:     #000000
*.color8:     #4D4D4D
*.color1:     #FF5555
*.color9:     #FF6E67
*.color2:     #50FA7B
*.color10:    #5AF78E
*.color3:     #F1FA8C
*.color11:    #F4F99D
*.color4:     #BD93F9
*.color12:    #CAA9FA
*.color5:     #FF79C6
*.color13:    #FF92D0
*.color6:     #8BE9FD
*.color14:    #9AEDFE
*.color7:     #BFBFBF
*.color15:    #E6E6E6

*selectToClipboard: true
```

then type  `xrdb ~/.Xresources`. What's `xrdb`?:

	Xrdb  does  not  load any files on its own, but many desktop environments use xrdb to load ~/.Xresources files on session startup to initialize the resource database, as a generalized replacement for ~/.Xdefaults files.
