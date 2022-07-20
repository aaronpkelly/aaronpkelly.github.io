What's [ripgrep](https://github.com/BurntSushi/ripgrep)?:

> ripgrep recursively searches directories for a regex pattern while respecting your gitignore

What's ripgrep-all?:

> rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc

https://github.com/phiresky/ripgrep-all

# interaction with fzf

from the example on theri github:

	rga-fzf() {
		RG_PREFIX="rga --files-with-matches"
		local file
		file="$(
	 FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
	 fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
	 --phony -q "$1" \
	 --bind "change:reload:$RG_PREFIX {q}" \
	 --preview-window="70%:wrap"
	 )" &&
		echo "opening $file" &&
		xdg-open "$file"
	}

# see also

[Tools I use daily](Tools%20I%20use%20daily.md)