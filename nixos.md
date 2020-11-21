# wifi

i had to use networkmanager to use my wifi on my dell

```
networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # aaron: enable the networkmanager
  networking.networkmanager.enable = true;
  # networking.networkmanager.unmanaged = [
  # "*" "except:type:wwan" "except:type:gsm"
  # ];

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp58s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
```

then i used `nmtui` from the command-line

# erasing my darlings

I read a [post](https://news.ycombinator.com/item?id=22856199) on HN about a guy who used NixOS + ZFS to create an immutable operating system. I wanted to try it out!

I found that following his instructions wasn't straightforward as I've no experience with ZFS, but I found a guy who [created a script](https://gist.github.com/mx00s/ea2462a3fe6fdaa65692fe7ee824de3e) of the entire process.

I did need to make some changes to that script though...

When a partition is created on my SSD, it prepends a `p` before the new partition number, so I had to account for this:

```
- export DISK_PART_ROOT="${DISK_PATH}1"
+ export DISK_PART_BOOT="${DISK_PATH}p2"
- export DISK_PART_ROOT="${DISK_PATH}1"
+ export DISK_PART_BOOT="${DISK_PATH}p2"
```

Also, after rebooting, the wrong UUID was being used by the OS, and the system would never start. I found [this issue](https://github.com/NixOS/nixpkgs/issues/62444) was already reported, and their fix was simple - just add `udevadm trigger` before generating the config. I updated the script with this and it worked fine:

```
  info "Installing NixOS to /mnt ..."
+ udevadm trigger
  ln -s /mnt/persist/etc/nixos/configuration.nix /mnt/etc/nixos/configuration.nix
  nixos-install -I "nixos-config=/mnt/persist/etc/nixos/configuration.nix" --no-root-passwd  # already prompted for and configured password
```

I've created a fixed version of the original install script, but with networkmanager enabled and my 2 fixes: https://paste.sr.ht/~aaronkelly/8719f57570aa85295a7151f164cfd4f47a4be267

From here on, I'll version my zsh-specific NixOS configuration file in my private repo: https://git.sr.ht/~aaronkelly/configfiles/tree/master/nixos