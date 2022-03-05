---
title: My first Nix overlay
description: How I dealt with a nix rebuild issue by patching a derivation myself
date: 2022-03-05
tags:
  - nixos
---

I ran into a problem the other day where I was unable to rebuild my NixOS configuration due to a problem with thermald:

	$ sudo nixos-rebuild switch
	...
	Making all in .
	make[2]: Entering directory '/build/source'
	  CXX      src/thermald-main.o
	  CXX      src/thermald-thd_dbus_interface.o
	  CXX      src/thermald-thd_engine.o
	  CXX      src/thermald-thd_cdev.o
	  CXX      src/thermald-thd_cdev_therm_sys_fs.o
	  CXX      src/thermald-thd_engine_default.o
	  CXX      src/thermald-thd_engine_adaptive.o
	src/thd_engine_adaptive.cpp: In member function 'int cthd_engine_adaptive::evaluate_lid_condition(condition)':
	src/thd_engine_adaptive.cpp:1002:61: error: 'gboolean up_client_get_lid_is_closed(UpClient*)' is deprecated [8;;https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wdeprecated-declarations-Werror=deprecated-declarations8;;]
	 1002 |  bool lid_closed = up_client_get_lid_is_closed(upower_client);
	      |                                                             ^
	In file included from /nix/store/20mc2h51sw8kgj5igfm74pqcpb5g4zsm-upower-0.99.15-dev/include/libupower-glib/upower.h:38,
	                 from src/thd_engine_adaptive.h:30,
	                 from src/thd_engine_adaptive.cpp:32:
	/nix/store/20mc2h51sw8kgj5igfm74pqcpb5g4zsm-upower-0.99.15-dev/include/libupower-glib/up-client.h:98:11: note: declared here
	   98 | gboolean  up_client_get_lid_is_closed  (UpClient  *client);
	      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
	cc1plus: all warnings being treated as errors
	make[2]: *** [Makefile:903: src/thermald-thd_engine_adaptive.o] Error 1
	make[2]: Leaving directory '/build/source'
	make[1]: *** [Makefile:1463: all-recursive] Error 1
	make[1]: Leaving directory '/build/source'
	make: *** [Makefile:559: all] Error 2
	error: builder for '/nix/store/3qrj9qxpn2fc6hp0qnmksb6zpn5dsvv8-thermald-2.4.8.drv' failed with exit code 2
	error: 1 dependencies of derivation '/nix/store/yqskvlpan0ylpckn8h760jlmy0jy5xrj-dbus-1.drv' failed to build
	error: 1 dependencies of derivation '/nix/store/948n7w885c6l73rl21vj93pahrz9mml8-unit-thermald.service.drv' failed to build
	error: 1 dependencies of derivation '/nix/store/0h9ph1piccc8lij4ykfcb4bd9k27pvv4-etc.drv' failed to build
	error: 1 dependencies of derivation '/nix/store/mmzg752mpry5h13x6h8wcm7g31bz4g9p-nixos-system-nixos-22.05pre358459.3e072546ea9.drv' failed to build

Oh. This isn't good.

I went to https://github.com/NixOS/nixpkgs/issues and searched for `thermald`, and sure enough I found this: https://github.com/NixOS/nixpkgs/pull/162568

It looked like someone already had the solution - append `--disable-werror` to the compilation flags.

But how long until this patch arrived in my channel, *nixos-unstable*? I had rebuilt multiple times over the past few days and hadn't seen the change.

So, I decided to see if I could apply this patch myself. I knew https://nixos.wiki/wiki/Overlays were a thing but I never used them.

Anyway, long story short, I looked at the _Files changed_ tab, and saw that the patch was targeting _thermald/default.nix_ with this change:

	  configureFlags = [
	    "--sysconfdir=${placeholder "out"}/etc"
	    "--localstatedir=/var"
	    "--enable-gtk-doc"
	    "--with-dbus-sys-dir=${placeholder "out"}/share/dbus-1/system.d"
	    "--with-systemdsystemunitdir=${placeholder "out"}/etc/systemd/system"
	    "--disable-werror"
	  ];

I discovered that I didn't have to wait for this patch to arrive, I could apply this change myself to my local configuration file, and get the patch early:

In _configuration.nix_, I added the following:

    nixpkgs.overlays = [ (self: super:
        {
                thermald = super.thermald.overrideAttrs (old: {
                        configureFlags = old.configureFlags ++ [ "--disable-werror" ];
                });
        }
    )];

And it was successful!

To be honest the overlay mechanism is still a bit opaque to me, I understand that what I'm doing above is appending an extra build flag to the existing thermald derivation, but I'm still not very comfortable with the functional syntax.

Anyway, it worked.

# See also

[nixos](nixos.md)]