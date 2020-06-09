---
title: A REPL in your shell with FZF
description: Using fzf as a REPL for every command you type on your shell
date:   2017-09-24
categories:
	- fzf
	- fun
---

# A REPL in your shell with FZF
I first discovered [[fzf]] via [a post](https://news.ycombinator.com/item?id=20455857) on hacker news, which demonstrated that in addition to all it's fuzzy-searching greatness, the output of the `fzf` could be used as a REPL - instantly running and displaying the output of a command as it's typed.

The trick is to pipe an empty search into `fzf`: `: | [YOUR_QUERY]`. This makes `fzf` operate only on the query you give it.

Below are a few examples where this behaviour can be used in surprising and effective ways.

## jq - interactive

Use the following to interact with real API responses in realtime, or an a JSON file on disk: 

```
: | fzf --preview 'curl https://jsonplaceholder.typicode.com/posts | jq {q}'
```

## Python/Ruby REPL
Substituting `python` or `ruby` in the below command will give you instant REPL output for that programming language.

Ruby:

```
: | (fzf --multi --preview 'ruby -e {q}' --preview-window=up:70 )
```

Python:
```
: | (fzf --multi --preview 'python -c {q}' --preview-window=up:70 )
```

## Bash/Zsh/Fish REPL
I wanted to take that further... could `fzf` be used to execute shell commands, and output the result?

Yes it can - but caution needs to be exercised, as on every keystroke the command will be executed immediately. If you want a safer version of this, check out [Ultimate Plumber](https://github.com/akavel/up), which waits until you press Enter to execute.

Anyway, thanks to a commenter on [this thread](https://news.ycombinator.com/item?id=20455857), the below command will cause your chosen shell to instantly evaluate any command you type. For me, this is extremely handy when constructing complicated `bash` queries using `sed`/`awk` etc, as I can previewing the output as I type:

```
: | fzf --multi --preview='bash -c {q}' --preview-window=up:70
```


# See also

https://github.com/junegunn/fzf