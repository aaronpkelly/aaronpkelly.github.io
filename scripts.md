# Migrating all my git repos to git.sr.ht

For a long time I've wanted to move all of my operatins to https://sourcehut.org/, I just really like the site.

## Migrating git repos

I wrote a script to help me with the migration.

This script requires:
- a Github API token in order to generate a complete list of public and private repos owned by the user

What does it do?:
- generates a list of repor



```
#!/bin/bash

set -eox

GIT_USER=aaronpkelly
GIT_PASS=****
GIT_API_TOKEN=****

git_getListOfRepos() {

        curl "https://api.github.com/user/repos?access_token=$GIT_API_TOKEN&per_page=100" | grep clone_url
}

git_getListOfRepos_cut() {

        git_getListOfRepos | grep clone_url | cut -d'/' -f4,5 | rev | cut -c7- | rev
}

for REPO in $(git_getListOfRepos_cut); do
        git clone "https://${GIT_USER}:${GIT_PASS}@github.com/${REPO}"
        REPO_BASENAME=$(echo "$REPO" | cut -d '/' -f 2)
        sed -i "s/url.*/url = git@git.sr.ht:~aaronkelly\/${REPO_BASENAME}/g" "${REPO_BASENAME}/.git/config"
        cd "$REPO_BASENAME"
        git push
        cd ..
done
```


If you want to read from a file _repos.txt_ instead, this is also possible:

```
"~/11-tech/11-docs/Migrating all my git repos to git.sr.ht.md" [noeol] 58L, 1409B                                                                                                                1,1           Top
```

# sine wave thing
```
# #! /bin/bash

set -ex

# set variables needed for generating a sine wave
CHANNELS=2
FREQUENCY_HZ_MIN=261.63
FREQUENCY_HZ_MAX=2093
TEST=sine

# these variables aren't used
# NPERIODS=4
# RATE_HZ=4000
# BUFFER_MICROSECONDS=1000000
# NLOOPS=1

# system system devices, used to read for values
HARD_DISK=nvme0n1p1

getHardDiskCapacity() {
        # look for the block device
        rst=$(df | grep 'nvme0n1p1' | cut -d ' ' -f 7)

        # remove the percent sign '%' sign from the end
        echo ${rst:0:-1}
}

runTest() {
        speaker-test \
                --channels "$CHANNELS" \
                --test "$TEST" \
                --frequency=$BC_RESULT

                # I really did want to use these but I didn't
                # find any use for them
                # --period 32 \
                # --nloops "$NLOOPS"
                # --buffer "$BUFFER_MICROSECONDS"
                # --rate="$RATE_HZ"
                # --period "$NPERIODS"
}

HARD_DISK_CAPACITY_PERCENT=$(getHardDiskCapacity)

# bash doesn't do floating point arithmetic - you have to use
# this tool called 'bc' to do the calculation for you
BC_RESULT=$(bc <<< "scale=2; $HARD_DISK_CAPACITY_PERCENT / 100 * $FREQUENCY_HZ_MAX")

# finally.. run the program!
```

# xrandrs
## cat xrandr_external_DP-1.sh
```
#!/bin/bash

xrandr --output DP-1 --auto --primary
xrandr --output eDP-1 --off
```

## cat xrandr_internal_eDP-1.sh
```
#!/bin/bash

xrandr --output eDP-1 --auto --primary
xrandr --output DP-1 --off
```

## cat xrandr_resetResolution.sh
```
set -x
RES="1920 1200 60" && \
DISP=$(xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/") && \
MODELINE=$(cvt $(echo $RES) | grep -e "Modeline [^(]" | sed -r 's/.*Modeline (.*)/\1/') && \
MODERES=$(echo $MODELINE | grep -o -P '(?<=").*(?=")') && \
cat > ~/.xprofile << _EOF
#!/bin/sh
xrandr --newmode $MODELINE
xrandr --addmode $DISP $MODERES
_EOF
set +x
```

# get last 100 builds
```
#! /bin/bash
set -eux

BUILD_NUM_START="$1"
BUILD_NUM_END="$2"
URL='https://builds.sr.ht/~aaronkelly/job'
MANIFEST='https://builds.sr.ht/api/jobs/'

for i in $(seq $BUILD_NUM_START $BUILD_NUM_END); do
	curl -L "${URL}/${i}" -o "$i"
	curl -L "${MANIFEST}/${i}/manifest" -o "${i}_manifest"
done
```

from api:
```
#! /bin/bash
set -eux

BUILD_NUM_START="$1"
BUILD_NUM_END="$2"
URL='https://builds.sr.ht/~aaronkelly/job'
MANIFEST='https://builds.sr.ht/api/jobs/'

for i in $(seq $BUILD_NUM_START $BUILD_NUM_END); do
	curl -L "${URL}/${i}" -o "$i"
	curl -L "${MANIFEST}/${i}/manifest" -o "${i}_manifest"
done
```