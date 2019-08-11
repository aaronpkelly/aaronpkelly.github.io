#!/usr/bin/env bash
# script for generating an index.md, which github pages automatically publishes

addReadme() {
	cat README.md >> index.md
}

main() {
	zeroOutIndexFile
	addReadme
	generateTOCs
	generatePosts
	generatePostList
}

generatePosts() {
	for file in posts/*.md; do
		cat "$file" >> posts/withTocs/"${file}"
	done
}

generatePostList() {
	for file in posts/withTOCs/*.md; do
		echo "[${file}](${file})" >> index.md
		echo "" >> index.md
	done
}

generateTOCs() {
	mkdir -p posts/withTOCs

	for file in posts/*.md; do
		./gh-md-toc "$FILE" > posts/withTOCs/"${file}"
	done
}

zeroOutIndexFile() {
	:>| index.md
}

main
