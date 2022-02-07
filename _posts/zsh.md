# zsh
I have it installed but I just use the defaults. I haven't really explored it yet

I've had no problems with it, apart from a weird character that kept appearing after a bash script I ran (i'll link when I remember it)
# powerlevel10k (git-status)
Amazing configuration setup - worked out of the box.

https://github.com/romkatv/powerlevel10k#oh-my-zsh

Quick setup:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```
Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
# agnoster theme? NO (powerline-like theme)
The instructions here may work:
https://github.com/agnoster/agnoster-zsh-theme

But if you need to install these fonts manually, I've taken their instructions and tweaked them:
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
sudo cp -R .local/share/fonts /usr/local/
```
# .zshrc
heavy inspiration from https://forum.manjaro.org/t/zsh-history-file-without-duplicates/123317

https://git.sr.ht/~aaronkelly/dotfiles/tree/master/.zshrc