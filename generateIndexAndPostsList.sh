#!/bin/bash

set -e

INDEX='index.md'
POSTS_DIR='posts'
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

generatePostList() {

    printf '\n\n' >> "$POSTS_FILE"

    IFS=$'\n'
	for file in $(ls "$POSTS_DIR" -t | grep '.md'); do
        echo "processing: $file"
		LAST_MODIFIED=$(stat -c %y "${POSTS_DIR}/${file}" | cut -d '.' -f1)
		echo "[$(basename ${file}) (Last updated: ${LAST_MODIFIED})](${POSTS_DIR}/${file})" >> "$POSTS_FILE"
		printf '\n' >> "$POSTS_FILE"
	done

    printf '\n' >> "$POSTS_FILE"
}

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

    if [ "$1" != "" ]; then
        generateTOC $1
    fi

	generatePostList
	addPosts
	addFooter
}

userConfirm() {
	read -p "Did you pass in the article names of any posts you want to refresh the TOCS on? [Y/N]" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		main $1
	fi
}

zeroOutIndexAndPOSTS() {
	:>| "$INDEX"
    :>| "$POSTS_FILE"
}

userConfirm $1
