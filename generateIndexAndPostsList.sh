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

    printf '\n' >> "$POSTS_FILE"

	for file in "$POSTS_DIR"/*.md; do
		echo "[$(basename $file)](${file})" >> "$POSTS_FILE"
	done

    printf '\n' >> "$POSTS_FILE"
}

main() {
	zeroOutIndexAndPOSTS
	addHeader
	generatePostList
	addPosts
	addFooter
}

userConfirm() {
	read -p "Did you refresh the TOCs for your updated articles? [Y/N]" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		main
	fi
}

zeroOutIndexAndPOSTS() {
	:>| "$INDEX"
    :>| "$POSTS_FILE"
}

userConfirm