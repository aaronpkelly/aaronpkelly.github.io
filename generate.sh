#!/usr/bin/env bash
# script for generating an index.md, which github pages automatically publishes

DIR_WITHTOCS="posts/withTOCs"

addFooter() {
	cat FOOTER.md >> index.md
}

addHeader() {
	cat HEADER.md >> index.md
}

clean() {
	rm -rf "$DIR_WITHTOCS"
	mkdir -p "$DIR_WITHTOCS"
}

main() {
	clean
	zeroOutIndexFile
	addHeader
	generateTOCs
	generatePosts
	generatePostList
	addFooter
}

generatePosts() {
	for file in posts/*.md; do
		cat "$file" >> "$DIR_WITHTOCS"/"$(basename $file)"
	done
}

generatePostList() {
	for file in "$DIR_WITHTOCS"/*.md; do
		echo "[$(basename $file)](${file})" >> index.md
		echo "" >> index.md
	done
}

generateTOCs() {
	for file in posts/*.md; do
		./gh-md-toc "$file" > "$DIR_WITHTOCS"/"$(basename $file)"
	done
}

zeroOutIndexFile() {
	:>| index.md
}

set -x
main
set +x
