# repl

## java

this is the easiest way I've found to run a REPL of a java/groovy program. Run this in one window:

	watch javac 'IsUnique.java && java IsUnique'

Then edit your file in another. You'll get output every 2s by default

## groovy

on nixos trying to get an environment to run groovy is very frustrating

but you can run the groovy docker image:

	watch docker run --rm -v "$PWD":/home/groovy/scripts -w /home/groovy/scripts groovy groovy test.groovy

note:

	-w, --workdir string                 Working directory inside the container