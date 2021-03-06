# My high-level linux workflow and goals
A great post on hackernews: https://news.ycombinator.com/item?id=19253072

This document will just define high-level behaviours that work for me, there are
other documents that go in to specifics, such as favourite programs etc.

Bias toward terminal programs, so that they can be used consistently from anywhere, including weak computers or a phone.
Use small, fast, and efficient programs
Use programs that can be automated

# Distributions - favourites
Powerful workstation: Gentoo
Middling workstation: Manjaro (based on Arch)
Lightweight workstation: ?
Container workstation: CoreOS (flatcar linux?)
Raspberry pi: BalenaOS, Raspbian

# Terminals
## use a hard terminal (ctrl+alt+F*)
Try to get away from using a terminal emulator within a graphical session.
Instead, use a hard terminal (ctrl+alt+f1...)

## tty environment: every terminal must start with midnight commander(mc)
every hard terminal you have should be started with midnight commander
running. this is for *easy access* to the filesystem, and with the knowledge
that a shell can be entered by using a key combination `ctrl+0` by default.

## Terminal multiplexing
where possible, use a terminal multiplexer like tmux inside of every shell. so this means:
`mc -> ctrl+0 -> tmux`

### keep logically similar actions inside a tmux window
start a new tmux window for each logically different operation.
if you need extra windows to help you with your operation, split the tmux
pane into windows - don't create a new window.

## additional ttys
try to use their numbers to logically sort them, local sessions using low
numbers, remote sessions using high numbers:

	tty1: mc + tmux
	tty2:
	tty3:
	tty4:
	tty5: music (mocp)
	tty6: remote sessions(ssh/scp/ftp)


# Persisting files
## Git
all my dotfiles are saved on git. whenever I have a fresh installation,
I clone my dotfiles and use a makefile to symlink my environment.
i make an effort to just use the defaults for many program,s rather than
having a billion custom dotfiles, but sometimes this is unavoidable.

i have forked jessfraz's dotfiles, and am adding to that.

# Scripting
Bash is preferable, it's used everywhere.
If a task is too hard to script in bash, use Python or Nim.

# Windowing
## i3
just do it

## Virtual desktop/workspaces
use a workspace-based organisational method to group logical activities:
	workspace1: browsers
	workspace2: file manager
	workspace3: terminals
	workspace4: enterntainment

## Tabbed terminals
`CTRL SHIFT T` creates a new tab in your terminal window. use this for
logically organising terminal activities into groups.

starting a lot of shell scripts from the terminal? have these one one
tailing a lot of logfiles? have these on another