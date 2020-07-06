# bash
## .bashrc
Add this

```
#Powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi
```

# .zshrc
Just use the agnoster theme - it's similar to powerline.
See [[zsh]]

# additional fonts
See [[fraidyc.at]]