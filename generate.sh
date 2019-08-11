#!/usr/bin/env bash
# script for generating an index.md, which github pages automatically publishes

DIR_WITHTOCS="posts/withTOCs"

addReadme() {
	cat README.md >> index.md
}

clean() {
	rm -rf "$DIR_WITHTOCS"
	mkdir -p "$DIR_WITHTOCS"
}

main() {
	clean
	zeroOutIndexFile
	addReadme
	generateTOCs
	generatePosts
	generatePostList
}

generatePosts() {
	for file in posts/*.md; do
		cat "$file" >> "$DIR_WITHTOCS"/"$(basename $file)"
	done
}

generatePostList() {
	for file in "$DIR_WITHTOCS"/*.md; do
		echo "[${file}]($(basename $file))" >> index.md
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
