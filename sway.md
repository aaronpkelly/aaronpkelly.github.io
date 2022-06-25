# floating windows

it works the same as i3: `mod + shift + space`

# taking screenshots

screenshots (https://jolyonbrown.com/post/sway-screenshots/):

	#!/bin/bash
	FILENAME="screenshot-`date +%F-%T`"
	grim -g "$(slurp)" ~/Pictures/$FILENAME.png
	
- grim is a utility for taking screenshots from a Wayland compositor
- slurp is a utilty for selecting a region

# intellij idea doesn't load properly

read the sway docs! https://github.com/swaywm/sway/wiki#issues-with-java-applications :

> Some Java AWT applications will not display properly unless you set the following.
> _JAVA_AWT_WM_NONREPARENTING=1

run this:

	export _JAVA_AWT_WM_NONREPARENTING=1 && idea-ultimate
	
got info from here: https://youtrack.jetbrains.com/issue/JBR-1315