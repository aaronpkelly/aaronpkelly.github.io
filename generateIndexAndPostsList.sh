#!/bin/bash

set -e

INDEX='index.md'
POSTS_DIR='_posts'
POSTS_FILE='POSTS.md'
HEADER_FILE='HEADER.md'
FOOTER_FILE='FOOTER.md'

addFooter() {
	cat "$FOOTER_FILE" >> "$INDEX"
}

addHeader() {
	cat "$HEADER_FILE" >> "$INDEX"
}

addPosts() {
    cat "$POSTS_FILE" >> "$INDEX"
}

cleanup() {
	rm "$POSTS_FILE"
}

generatePostList() {

	TYPE=$1

	printf '\n\n' >> "$POSTS_FILE"

	IFS=$'\n'
	for file in $(ls "$POSTS_DIR" | grep -e '^[0-9].*md$'| sort --reverse); do
        	echo "processing: $file"

		if [ "$TYPE" == "markdown" ]; then
			# LAST_MODIFIED=$(stat -c %y "${POSTS_DIR}/${file}" | cut -d '.' -f1)
			POST_TITLE=$(getTitle "${POSTS_DIR}/${file}")
			echo "[${POST_TITLE} (Last updated: ${LAST_MODIFIED})](${POSTS_DIR}/${file})" >> "$POSTS_FILE"
		elif [ "$TYPE" == "mediawiki" ]; then
			echo "[[${POSTS_DIR}/${file%.*}]]" >> "$POSTS_FILE"
		else
			echo "unknown link type provided"
			exit -1
		fi
			
		printf '\n' >> "$POSTS_FILE"
	done

    printf '\n' >> "$POSTS_FILE"
}

getTitle() {

    FILE_PATH=$1
    BASENAME=$(basename ${FILE_PATH})
    FRONT_MATTER=$(sed -n '2,2p;3q' ${FILE_PATH} | cut -d ' ' -f 2- )
    size=${#FRONT_MATTER}
    # echo "The size of FRONT_MATTER is ${size}"

    if [ "$size" -gt 0 ]; then
        echo "$FRONT_MATTER"
    else
        echo "$BASENAME"
    fi
}

# i have this cool function to generate TOCs, but I don't use it anymore
generateTOC() {
    echo "Generating TOC for $1"
    
	cp "${POSTS_DIR}/$1" "${POSTS_DIR}/$1.orig"
    ./gh-md-toc "${POSTS_DIR}/$1.orig" > "${POSTS_DIR}/$1"
    
    # -e: enable interpretation of backslash escapes 
    echo -e "\n" >> "${POSTS_DIR}/$1"
    
    cat "${POSTS_DIR}/$1.orig" >> "${POSTS_DIR}/$1"
    rm "${POSTS_DIR}/$1.orig"
}

main() {
	zeroOutIndexAndPOSTS
	addHeader
	generatePostList "$LINK_TYPE"
	addPosts
	addFooter
	cleanup
}

userConfirm() {

	LINK_TYPE="$1"

	if [ ! "$LINK_TYPE" ]; then
		usage
		exit -1
	fi

	read -p "Will generate post lists with "$LINK_TYPE" links. Happy to proceed? [Y/N]" -n 1 -r
	echo
	
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		main "$LINK_TYPE"
	fi
}

usage() {
	echo "Usage: ${0} [mediawiki|markdown]"
}

zeroOutIndexAndPOSTS() {
	:>| "$INDEX"
    :>| "$POSTS_FILE"
}

userConfirm $1
