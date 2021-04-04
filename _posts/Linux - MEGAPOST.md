# Linux
I use Linux as my primary operating system, mainly [nixos](nixos.md), [[MX Linux]], and [[alpine]]. I use [[zsh]] as my shell and [[i3]] as my window manager.

For a complete list of all tools I use, you should see [[Tools I use daily]].

# system users and system groups

	There is no inherent difference between system groups and 'normal' groups, just like there is none between system users and regular users. It is by convention that human users are assigned uids from a certain number (e.g. 1000) upwards, whereas system users get uids in a range below that number.

	**The actual uid number, apart from the special uid 0 which is reserved for `root`, has no meaning at all and does not convey any privileges.**

	We distinguish system users and regular users only because they are treated differently. For instance, there is no point in displaying system users in a graphical login manager. Also, most system users don't need a login shell or home directory, whereas human users (normally) do.

	The `--system` option of the `adduser` command is no more than a convenience for the administrator, as it presets a number of options to sensible values for a 'system account'. In fact, the whole `adduser` command is a convenience wrapper around (lower level commands like `useradd` and `groupadd`, which are wrappers around) essentially just editing `/etc/passwd` and `/etc/group`. - [zwets](https://askubuntu.com/users/134479/zwets)
	
Also

	When you create a system user, by the fault the command doesn't create a home folder and its terminal is set to /bin/false, whereas for normal users these defaults doesn't apply. – [Peregring-lk](https://askubuntu.com/users/142085/peregring-lk "205 reputation")

via https://askubuntu.com/questions/523949/what-is-a-system-group-as-opposed-to-a-normal-group


## See also

[[Backgrounding jobs in Linux]]

[[Named pipes in Linux]]