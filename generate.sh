#!/usr/bin/env bash
# script for generating an index.md, which github pages automatically publishes
set -x

cat README.md > index.md
printf "\n" >> index.md

for file in posts/*.md; do
	echo "[${file}](${file})" >> index.md
	echo "" >> index.md
done

set +x
