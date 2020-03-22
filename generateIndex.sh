#!/bin/bash

INDEX='index.md'
POSTS_DIR='posts'
POSTS_FILE='posts.md'

addFooter() {
	cat FOOTER.md >> $INDEX
}

addHeader() {
	cat HEADER.md >> $INDEX
}

generatePostList() {
	for file in "$POSTS_DIR"/*.md; do
		echo "[$(basename $file)](${file})" >> "$POSTS_FILE"
	done
}

main() {
	zeroOutIndexAndPOSTS
	addHeader
	generatePostList
	addFooter
}

zeroOutIndexAndPOSTS() {
	:>| "$INDEX"
    :>| "$POSTS"
}

main