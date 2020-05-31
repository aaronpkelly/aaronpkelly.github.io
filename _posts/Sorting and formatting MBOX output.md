---
title: Sorting and formatting an MBOX export
description:
date: 2020-03-04
tags:
    - mbox
---

# Sorting and Formatting the MBOX export

## Analysis of export

Getting a summary of the exported file types:

```
find . -type f | sed 's/.*\.//' | sort | uniq -c
```


### One folder per extension

I created a script to go though every attachment, and make a copy of it into
its own folder:

```
for extension in $(find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u); do
        if [ "$extension" != "mbox" ]; then
                extension_lowercase="$(echo ${extension} | tr '[:upper:]' '[:lower:]')"
                mkdir "$extension_lowercase"

                find . -name "*.${extension}" -exec cp {} "$extension_lowercase" \;
        fi
done
set +x
```

### Renaming images to signature

In a controvertial move, I decided to rename the file to be it's file signature
as calculated by ImageMagick. I store the original filename as EXIF metadata
in the DocumentName field:

```
#!/usr/bin/env ash

for file in *; do
	exiftool \
		-overwrite_original \
		-ignoreMinorErrors \
		-DocumentName="$file" "$file"

	signature="$(identify -verbose "$file" | grep signature | cut -d ' ' -f 6)"
	extension="$(echo ${file##*.})"
	extension="$(echo ${extension} | tr '[:upper:]' '[:lower:]')"
	mv "$file" "$signature"."$extension"
done	
```


## Preparing the export for upload to Bandcamp

Because I'm masochistic:

```

```

