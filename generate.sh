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
		
		# add a couple of linebreaks after the table of contents.
		# -e: enable interpretation of backslash escapes 
		echo -e "\n\n" >> "$DIR_WITHTOCS"/"$(basename $file)"
	done
}

userConfirm() {
	read -p "This operation is destructive! Are you sure you haven't mistakenly made changes to the 'withTOCS' files? These will be destroyed. [Y/N]" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		main
	fi
}


zeroOutIndexFile() {
	:>| index.md
}

userConfirm
