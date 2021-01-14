# lftp
the ideal cli ftp tool

login:

```
$ lftp -u psb47851,<PASSWORD> ftp://psb47851.seedbox.io
```

Once logged in, Remeber to set ssl to false:

```
set ssl:verify-certificate false
```

use `mget` to get multiple files
use `mirror` to get a directory

# ftp
if you really want to use the basic program...

## auto-login
use a netrc file to automatically log in to ftp sites

## common commands

use `ascii` mode to ...
use `binary` mode for transferring files

mget to get multiple files

```
 mget m?
```