# installing msi installers

use wine's `msiexec`


# battle.net games on linux

don't drink old wine
--------------------
your package manager may use an older version. download wine from the wine
repository (google it)

console yourself
----------------
when running battle.net games for the first time, run them from the console:

	wine Hearthstone.exe

this will tell you **what .dll files to mess around with** in winecfg.

winecfg
-------
you shouldn't need me to provide you with a list of files, you should do what
it says above and run the game from the console, and find out which files it
has a problem with - then disable/run natively those ones.

but anyway, here's a list of files that i've had problems with in the past,
and their settings:

	msvcp140	native/builtin

other settings, not to be tried until you've tried only the above first:

	atl123		?
	dbghelp		?
	msvcp100	?
	msvcp123	?
	msvcr123	?
	vcomp123	?
	wininet		?
