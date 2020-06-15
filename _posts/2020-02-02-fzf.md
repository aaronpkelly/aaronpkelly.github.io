---
title: fzf
description:
date: 2020-02-02
categories:
  - tech
tags:
  - search
  - cli
---

# FZF

## keybinds
The install script adds:
- `CTRL+R`
- `CTRL+T`
- `ALT-C`

In my `zsh` shell these weren't enabled by default, maybe one day I'll figure out how to enable them.

## Killer features
These options are what make `fzf` great for me

### --preview
Opens a preview pane to view the output of the command. The preview pane also supports ANSI colours, so you can use any program that takes full advantage of this (syntax highlighting...)

### --multi (-m)
Allows you to select multiple results with `TAB`. Pressing `ENTER` will echo the results back you to your terminal, or optionally, can be passed to a program.

# Useful fzf queries
Note: most of the below queries will by default have the `--multi` (`-m`) option enabled.

## Find file by name and display contents

Find a file by name and display its contents in the preview pane:

```
fzf --preview 'find . -type f -name {q} | head -100 {}'
```

## Search for file contents (using grep/ripgrep)
The contents of the file will be dispalyed in the search results:

```
grep --line-buffered --color=never --ignore-case --recursive "" | fzf
```

## Generate a list, mark rows, perform action
This is useful for tasks such as:
- searching bash history, marking command(s) you want to rerun, and running them as soon as `fzf` exits
- searching currently installed programs, marking them, and upgrading only the marked ones

### Searching bash history, execute command
A good replacement for bash's history search `CTRL+R` is the _built-in_ history search that comes with `fzf`:


You can also create your own!:

```
 history | fzf -m | cut -c 8- | bash
```

### Searching for installed applications and upgrading them

In this example, the results are processed using `cut` and then saved to a variable:

```
~ RST=$(apt list --installed | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='search'" | cut -d '/' -f 1)
~ echo $RST
asciinema
baobab
```

Instead of saving to a variable, you could immediately pass those results to a program:

```
~ sudo apt install --only-upgrade $(apt list --installed | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='search'" | cut -d '/' -f 1)

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists... Done
Building dependency tree       
Reading state information... Done
asciinema is already the newest version (2.0.2-1).
baobab is already the newest version (3.30.0-2).
0 upgraded, 0 newly installed, 0 to remove and 7 not upgraded
```


## Instant search (WIKIs, search engines..)
Very handy when you want to get instant results! This uses `w3m --dump` to format the html page into plain text.

DuckDuckGo:

```
 : | (fzf --multi --preview 'w3m -dump https://duckduckgo.com/\?q\={q}' --preview-window=up:70 )
```

Wikipedia - the exact title must match for the article to be found:

```
: | (fzf --multi --preview 'w3m -dump https://en.wikipedia.org/wiki/{q}' --preview-window=up:70 )
```

Dark Souls 3 wiki - I remove the first n lines because it's all boilerplate HTML:

```
: | (fzf --multi --preview 'w3m -dump https://darksouls3.wiki.fextralife.com/{q} | tail -n +344' --preview-window=up:70 )
```

# Resources
https://github.com/junegunn/fzf#preview-window

Or even better:

```
man fzf
```