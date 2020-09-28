pull the image.

you can now use `docker export` or `docker save` (look up docs)

then:
`docker export <IMAGE> <IMAGE>.tar`

the tar will be in many layers, not great

"Unfortunately, these tarballs are really only useful to Docker. However, there
is a tool called “undocker” (https://github.com/larsks/undocker/) which can
extract a useful filesystem from these images. See here for a writeup from the
author: http://blog.oddbit.com/2015/02/13/unpacking-docker-images/"

https://github.com/larsks/undocker/ works great, I tried it