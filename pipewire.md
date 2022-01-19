# audio issues?

## browser audio, or general?

If it's just a a browser issue, it's probably to do with pulseaudio support - FIrefox and Chrome use pulseaudio, and forcing them to use ALSA is tricky. So, there's something wrong with pipewire+pulseaudio. See the firefox section. 

If it's a general audio issue, see below

## list audio devices

	❯ aplay -l
	**** List of PLAYBACK Hardware Devices ****
	card 0: PCH [HDA Intel PCH], device 0: ALC3246 Analog [ALC3246 Analog]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0
	card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0
	card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0
	card 0: PCH [HDA Intel PCH], device 8: HDMI 2 [HDMI 2]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0
	card 0: PCH [HDA Intel PCH], device 9: HDMI 3 [HDMI 3]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0
	card 0: PCH [HDA Intel PCH], device 10: HDMI 4 [HDMI 4]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0


## pipewire services started?

are the following services started?:

- `pipewire.socket`
- `pipewire.service`
- `pipewire-media-session.service`

NOTE: The `pipewire.socket` service will be the only service running initially. As soon as an application requests audio services via the `pipewire.socket`, the other services will start.

I don't use pulse, so `pipewire-pulse.service` is expected to not be found:

	❯ systemctl --user status pipewire.socket
	● pipewire.socket - Multimedia System
		 Loaded: loaded (/etc/systemd/user/pipewire.socket; enabled; vendor preset: enabled)
		Drop-In: /nix/store/9nfrplm90slgfv11nbxvmkrr2cy19ysy-user-units/pipewire.socket.d
				 └─overrides.conf
		 Active: active (listening) since Sat 2021-10-30 22:35:30 IST; 32s ago
	   Triggers: ● pipewire.service
		 Listen: /run/user/1000/pipewire-0 (Stream)
		 CGroup: /user.slice/user-1000.slice/user@1000.service/app.slice/pipewire.socket

	Oct 30 22:35:30 nixos systemd[2033]: Listening on Multimedia System.

	❯ systemctl --user status pipewire.service
	● pipewire.service - PipeWire Multimedia Service
		 Loaded: loaded (/etc/systemd/user/pipewire.service; linked-runtime; vendor preset: enabled)
		Drop-In: /nix/store/9nfrplm90slgfv11nbxvmkrr2cy19ysy-user-units/pipewire.service.d
				 └─overrides.conf
		 Active: active (running) since Sat 2021-10-30 21:55:54 IST; 4min 26s ago
	TriggeredBy: ● pipewire.socket
	   Main PID: 39964 (pipewire)
		  Tasks: 2 (limit: 9037)
		 Memory: 3.4M
			CPU: 85ms
		 CGroup: /user.slice/user-1000.slice/user@1000.service/session.slice/pipewire.service
				 └─39964 /nix/store/cprjqdjw20wk7h5dkkjig14k6204qy2r-pipewire-0.3.38/bin/pipewire
	Oct 30 21:55:54 nixos systemd[2029]: Started PipeWire Multimedia Service.
	
	❯ systemctl --user status pipewire-pulse.service
	Unit pipewire-pulse.service could not be found.
	
	❯ systemctl --user status pipewire-media-session.service
	● pipewire-media-session.service - PipeWire Media Session Manager
		 Loaded: loaded (/etc/systemd/user/pipewire-media-session.service; enabled; vendor preset: enabled)
		Drop-In: /nix/store/9nfrplm90slgfv11nbxvmkrr2cy19ysy-user-units/pipewire-media-session.service.d
				 └─overrides.conf
		 Active: active (running) since Sat 2021-10-30 21:55:54 IST; 6min ago
	   Main PID: 39965 (pipewire-media-)
		  Tasks: 2 (limit: 9037)
		 Memory: 3.7M
			CPU: 278ms
		 CGroup: /user.slice/user-1000.slice/user@1000.service/session.slice/pipewire-media-session.service
				 └─39965 /nix/store/b7jx5p6m0anjnb99zm49rs2lkqb04hz0-pipewire-0.3.38-mediaSession/bin/pipewire-media-session

	Oct 30 21:55:54 nixos systemd[2029]: Started PipeWire Media Session Manager.
	
sometimes the socket is active, but the services are dead:

	❯ systemctl --user status pipewire.socket
	● pipewire.socket - Multimedia System
		 Loaded: loaded (/etc/systemd/user/pipewire.socket; enabled; vendor preset: enabled)
		Drop-In: /nix/store/9nfrplm90slgfv11nbxvmkrr2cy19ysy-user-units/pipewire.socket.d
				 └─overrides.conf
		 Active: active (listening) since Sat 2021-10-30 22:35:30 IST; 32s ago
	   Triggers: ● pipewire.service
		 Listen: /run/user/1000/pipewire-0 (Stream)
		 CGroup: /user.slice/user-1000.slice/user@1000.service/app.slice/pipewire.socket

	Oct 30 22:35:30 nixos systemd[2033]: Listening on Multimedia System.

	❯ systemctl --user status pipewire.service
	○ pipewire.service - PipeWire Multimedia Service
		 Loaded: loaded (/etc/systemd/user/pipewire.service; linked-runtime; vendor preset: enabled)
		Drop-In: /nix/store/9nfrplm90slgfv11nbxvmkrr2cy19ysy-user-units/pipewire.service.d
				 └─overrides.conf
		 Active: inactive (dead)
	TriggeredBy: ● pipewire.socket

	❯ systemctl --user status pipewire-media-session.service
	○ pipewire-media-session.service - PipeWire Media Session Manager
		 Loaded: loaded (/etc/systemd/user/pipewire-media-session.service; enabled; vendor preset: enabled)
		Drop-In: /nix/store/9nfrplm90slgfv11nbxvmkrr2cy19ysy-user-units/pipewire-media-session.service.d
				 └─overrides.conf
		 Active: inactive (dead)
		
can you restart the services?
	
	systemctl --user restart pipewire.service
	# this should also restart the pipewire-media-session.service
	# so no need to run this command really
	systemctl --user restart pipewire-media-session.service

any errors in the logs?

	# specific
	journalctl -b --user -u pipewire.service
	# media-session
	journalctl --user -b --unit pipewire-media-session.service
	# general
	journalctl -p err
	
## bad config files?

	❯ ls /etc/pipewire -al
	lrwxrwxrwx 35 root 30 Oct 21:30 client-rt.conf -> /etc/static/pipewire/client-rt.conf
	lrwxrwxrwx 32 root 30 Oct 21:30 client.conf -> /etc/static/pipewire/client.conf
	lrwxrwxrwx 30 root 30 Oct 21:30 jack.conf -> /etc/static/pipewire/jack.conf
	drwxr-xr-x  - root 30 Oct 21:30 media-session.d
	lrwxrwxrwx 40 root 30 Oct 21:30 pipewire-pulse.conf -> /etc/static/pipewire/pipewire-pulse.conf
	lrwxrwxrwx 34 root 30 Oct 21:30 pipewire.conf -> /etc/static/pipewire/pipewire.conf

	❯ ls /etc/pipewire/media-session.d -al
	lrwxrwxrwx 54 root 30 Oct 21:30 alsa-monitor.conf -> /etc/static/pipewire/media-session.d/alsa-monitor.conf
	lrwxrwxrwx 55 root 30 Oct 21:30 media-session.conf -> /etc/static/pipewire/media-session.d/media-session.conf
	lrwxrwxrwx 54 root 30 Oct 21:30 v4l2-monitor.conf -> /etc/static/pipewire/media-session.d/v4l2-monitor.conf
	lrwxrwxrwx 46 root 30 Oct 21:30 with-alsa -> /etc/static/pipewire/media-session.d/with-alsa

stop pipewire service

	systemctl --user stop pipewire.service
	Warning: Stopping pipewire.service, but it can still be activated by:
	  pipewire.socket
	systemctl --user stop pipewire-media-session.service
	
delete

	rm -rf /etc/pipewire
	
restart the services

 	systemctl --user restart pipewire.service
	systemctl --user restart pipewire-media-session.service

## firefox

### forcing also

firefox only works with pulse, but there is a way to force alsa:

	# https://nixos.wiki/wiki/Firefox
	# How to run Firefox without pulseaudio and still get audio output?
	programs.firefox.package = (pkgs.wrapFirefox.override { libpulseaudio = pkgs.libpressureaudio; }) pkgs.firefox-unwrapped { };


### cubeb (unresolved)

When starting firefox from the command-line, you may see this:

	[Child 47966, MediaDecoderStateMachine #1] WARNING: 7f83b80a19e0 OpenCubeb() failed to init cubeb: file /build/firefox-92.0/dom/media/AudioStream.cpp:324
	[Child 47966, MediaDecoderStateMachine #1] WARNING: Decoder=7f83b841c800 [OnMediaSinkAudioError]: file /build/firefox-92.0/dom/media/MediaDecoderStateMachine.cpp:3980
	[Child 47966, MediaDecoderStateMachine #1] WARNING: Decoder=7f83b841c800 Decode error: NS_ERROR_DOM_MEDIA_MEDIASINK_ERR (0x806e000b) - OnMediaSinkAudioError: file /build/firefox-92.0/dom/media/MediaDecoderStateMachine.cpp:3541
