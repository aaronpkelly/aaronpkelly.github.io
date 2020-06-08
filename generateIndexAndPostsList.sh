#!/bin/bash

# This script helps me:
# - generate a single index.md by
#  	- scanning which posts are ready for publishing (if they have YAML front-matter)
# 	- collating the contents of smaller files (HEADER, FOOTER)
# - convert my mediawkik-style markdown to Github-style markdown ()

set -e

INDEX='index.md'
POSTS_DIR_SOURCE='_posts'
# POSTS_DIR_TARGET="${POSTS_DIR_SOURCE}/jekyll"
POSTS_DIR_TARGET="${POSTS_DIR_SOURCE}"
POSTS_FILE='POSTS.md'
HEADER_FILE='HEADER.md'
FOOTER_FILE='FOOTER.md'

# a bash hashtable (aka associative array) to map what the original
# markdown filename was before it was converted to a jekyll file
declare -A convertedFileNames

addFooter() {
	cat "$FOOTER_FILE" >> "$INDEX"
}

addHeader() {
	cat "$HEADER_FILE" >> "$INDEX"
}

addPosts() {
    cat "$POSTS_FILE" >> "$INDEX"
}

# convert all mediawiki-style internal links '[[]]' to markdown-style []()
# using the hash table
convertWikiLinksToMarkdownLinks() {

	# if you want to see the contents of the table:
	# for filename in "${!convertedFileNames[@]}"; do echo "$filename - ${convertedFileNames[$filename]}"; done

	for key in "${!convertedFileNames[@]}"; do
		value="${convertedFileNames[$key]}"
		# echo "key is ${key}. value is ${value}"

		# here's the meat
		sed -i "s,\[\[${key}\]\],\[${key}\]\(\{\% ${value} \%\}\),g" $(grep --files-with-matches --recursive "\[\[${key}\]\]" ${POSTS_DIR_TARGET}/20*.md)

	done
}

cleanup() {
	rm "$POSTS_FILE"
}

# I 
cleanup_pre() {
	set -x
	rst=$(ls ${POSTS_DIR_TARGET}/20*.md | echo $?)
	if [ "$rst" -eq 0 ]; then
		cd "${POSTS_DIR_TARGET}"
		rm 20*.md
		cd ..
	fi
	set +x
}

# will only generate a jekyll-compatible post, YYYY-MM-DD-<POST>.md,
# only if front-matter is detected in the markdown file
generateJekyllPosts() {
	set -x

	IFS=$'\n'
	for file in $(ls "$POSTS_DIR_SOURCE"); do
		POST_DATE=$(getDateFromFrontMatter "${POSTS_DIR_SOURCE}/${file}")

		if [[ "$POST_DATE" =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$ ]]; then

			# replace filenname spaces with hyphens
			file_with_hyphen=${file// /-}

			cp "${POSTS_DIR_SOURCE}/${file}" "${POSTS_DIR_TARGET}/${POST_DATE}-${file_with_hyphen}"

			# keep a record of the file name conversion
			convertedFileNames["${file}"]="${POST_DATE}-${file_with_hyphen}"
		fi

	done

	set +x
}

generatePostList() {

	TYPE=$1
	printf '\n\n' >> "$POSTS_FILE"
	IFS=$'\n'

	if [ "$TYPE" == "markdown" ]; then
		for file in $(ls "$POSTS_DIR_TARGET" | grep -e '^[0-9].*md$'| sort --reverse); do
        	echo "[generatePostList] adding to ${POSTS_FILE}: $file"
			# LAST_MODIFIED=$(stat -c %y "${POSTS_DIR_SOURCE}/${file}" | cut -d '.' -f1)
			POST_TITLE=$(getTitle "${POSTS_DIR_TARGET}/${file}")
			# echo "[${POST_TITLE} (Last updated: ${LAST_MODIFIED})](${POSTS_DIR_SOURCE}/${file})" >> "$POSTS_FILE"
			echo "[${POST_TITLE}](${POSTS_DIR_TARGET}/${file})" >> "$POSTS_FILE"
			printf '\n' >> "$POSTS_FILE"
		done
	elif [ "$TYPE" == "mediawiki" ]; then
		echo "[[${POSTS_DIR_TARGET}/${file%.*}]]" >> "$POSTS_FILE"
		printf '\n' >> "$POSTS_FILE"
	else
		echo "unknown link type provided"
		exit -1
	fi
}

getDateFromFrontMatter() {
	FILE_PATH=$1
    BASENAME=$(basename ${FILE_PATH})
    FRONT_MATTER=$(sed -n '4,4p;5q' ${FILE_PATH} | cut -d ' ' -f 2-  | xargs) # xargs will trim leading and trailing whitespace!
	size=${#FRONT_MATTER}

	# echo "The size of FRONT_MATTER is ${size}"

	if [ "$size" -gt 0 ]; then
        echo "$FRONT_MATTER"
	fi
}

getTitle() {

    FILE_PATH=$1
    BASENAME=$(basename ${FILE_PATH})
    FRONT_MATTER=$(sed -n '2,2p;3q' ${FILE_PATH} | cut -d ' ' -f 2- )
    size=${#FRONT_MATTER}
    
	# echo "The size of FRONT_MATTER is ${size}"

    if [ "$size" -gt 0 ]; then
		echo "$FRONT_MATTER"
	fi
}

# i have this cool function to generate TOCs, but I don't use it anymore
generateTOC() {
    echo "Generating TOC for $1"
    
	cp "${POSTS_DIR_SOURCE}/$1" "${POSTS_DIR_SOURCE}/$1.orig"
    ./gh-md-toc "${POSTS_DIR_SOURCE}/$1.orig" > "${POSTS_DIR_SOURCE}/$1"
    
    # -e: enable interpretation of backslash escapes 
    echo -e "\n" >> "${POSTS_DIR_SOURCE}/$1"
    
    cat "${POSTS_DIR_SOURCE}/$1.orig" >> "${POSTS_DIR_SOURCE}/$1"
    rm "${POSTS_DIR_SOURCE}/$1.orig"
}

main() {
	cleanup_pre
	zeroOutIndexAndPOSTS
	generateJekyllPosts
	convertWikiLinksToMarkdownLinks
	addHeader
	generatePostList "$LINK_TYPE"
	addPosts
	addFooter
	cleanup
}

userConfirm() {

	set -x

	LINK_TYPE="$1"
	NON_INTERACTIVE="$2"

	if [ ! "$LINK_TYPE" ]; then
		usage
		exit -1
	fi

	if [ "$NON_INTERACTIVE" ]; then
		main "$LINK_TYPE"
		exit 0
	fi

	read -p "Will generate post lists with "$LINK_TYPE" links. Happy to proceed? [Y/N]" -n 1 -r
	echo
	
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		main "$LINK_TYPE"
		exit 0
	fi
}



usage() {
	echo "Usage: ${0} [mediawiki|markdown]"
}

zeroOutIndexAndPOSTS() {
	:>| "$INDEX"
    :>| "$POSTS_FILE"
}

userConfirm $1 $2
