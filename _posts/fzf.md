# FZF

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

## Search for file contents and display (using grep/ripgrep)
The contents of the file will be dispalyed in the preview pane:

```
fzf --preview 'grep --recursive -l {q} | head -100 {}'
```

## Generate a list, mark rows, perform action
This is useful for tasks such as:
- searching bash history, marking command(s) you want to rerun, and running them as soon as `fzf` exits
- searching currently installed programs, marking them, and upgrading only the marked ones

### Searching bash history, execute commands
A good replacement for bash's history search `CTRL+R`:

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

# Resources
https://github.com/junegunn/fzf#preview-window

Or even better:

```
man fzf
```