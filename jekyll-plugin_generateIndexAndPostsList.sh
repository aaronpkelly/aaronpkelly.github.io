#!/bin/bash

# This script helps me do a bunch of stuff:
# 	- generating my own post list, because some day I might not be using Jekyll:
# 		- it scans which posts are ready for publishing (currently, it detects if they have YAML front-matter)
# 	- collate the contents of smaller files HEADER and FOOTER
# 	- DISABLED: convert my mediawkik-style markdown to Github-style markdown ()

# TODO: fix this
# i want this enabled, but if grep fails to match a file, it will return 1 and trip this, ending my script early :(
# set -e

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

	set -x

	# if you want to see the contents of the table:
	# for filename in "${!convertedFileNames[@]}"; do echo "$filename - ${convertedFileNames[$filename]}"; done

	for key in "${!convertedFileNames[@]}"; do

		value="${convertedFileNames[$key]}"
		echo "key is ${key}. value is ${value}"

		# here's the meat
		matched="$(grep --files-with-matches --recursive "\[\[${key%.*}\]\]" ${POSTS_DIR_TARGET}/20*.md)"
		if [[ "$matched" != "" ]]; then
			sed -i "s,\[\[${key%.*}\]\],\[${key%.*}\]\(\{\% post_url ${value%.*} \%\}\),g" $() "$matched"
		fi

	done
	set +x
}

# by default, all the internal links inside a blog post will link to MD files instead of a HTML files... change that.
# re-uses similar code to the now defunct convertWikiLinksToMarkdownLinks()
# thank you to https://stackoverflow.com/questions/1583219/how-to-do-a-recursive-find-replace-of-a-string-with-awk-or-sed
changeMarkdownLinksTargetFromMdToHtml() {
	find ${POSTS_DIR_TARGET} \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/.md/.html/g"
}

# for all posts which were renamed to Jekyll-style names, e.g.:
#   from: crackingTheCodingInterview_interviewQuestions_1.1.md
#   to:   2021-05-19-crackingTheCodingInterview_interviewQuestions_1.1
# it searches inside1 them and converts normal markdown links to Jekyll's "liquid tags" format. e.g.:
#   from: [crackingTheCodingInterview_interviewQuestions_1.1](crackingTheCodingInterview_interviewQuestions_1.1.md)
#   to:   [crackingTheCodingInterview_interviewQuestions_1.1]({% post_url 2021-05-19-crackingTheCodingInterview_interviewQuestions_1.1 %})
# this allows me to use internal obsidian links normally, but "fixes" these
# links so that at publish-time, my Jekyll blog posts link to each other
changeMarkdownLinksToLiquidTagFormat() {
	for key in "${!convertedFileNames[@]}"; do
	  original_filename=$key
	  converted_file=${convertedFileNames[${key}]}
	  # if you know the extension, you can use basename to strip the file extension away
	  converted_file_basename="$(basename ${converted_file} .md)"

	  sed -i "s/$original_filename/{% post_url $converted_file_basename %}/g" "$POSTS_DIR_TARGET"/*.md
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

# this function will:
# - look inside the _posts directory
# - check if front-matter is detected in the markdown file
# - check if a DATE is provided in the front matter
# - rename the file to a jekyll-compatible post, YYYY-MM-DD-<POST>.md,
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

	# obsidian does this for me automatically now, but thank you for making the function
	# convertWikiLinksToMarkdownLinks

	# changeMarkdownLinksTargetFromMdToHtml
	changeMarkdownLinksToLiquidTagFormat

	addHeader
	
	# i'm going to use the Jekyll-generated one for now. Just trying it. Don't get md
	# generatePostList "$LINK_TYPE"
	# addPosts
	
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
