---
title: A REPL in your shell with FZF
description: Using fzf as a REPL for every command you type on your shell
date:   2017-09-24
layout: post
tags:
  - fzf
  - repl
---

# A REPL in your shell with FZF
I first discovered [fzf]({% post_url 2020-02-02-fzf %}) via [a post](https://news.ycombinator.com/item?id=20455857) on hacker news, which demonstrated that in addition to all it's fuzzy-searching greatness, the output of the `fzf` could be used as a REPL - instantly running and displaying the output of a command as it's typed.

The trick is to pipe an empty search into `fzf`: `: | [YOUR_QUERY]`. This makes `fzf` operate only on the query you give it.

Below are a few examples where this behaviour can be used in surprising and effective ways.

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

## jq

Use the following to interact with real API responses in realtime, or an a JSON file on disk: 

```
: | fzf --preview 'curl https://jsonplaceholder.typicode.com/posts | jq {q}'
```

## Rust? Rust!
Yes it's a compiled language, but this can be used for small programs (and it's pretty cool watching all the compiler messages as you type):

```
:| fzf --preview 'echo {q} > main.rs && rustc -o main main.rs && ./main'
```

Try giving it a litle something:

```
fn main() { println!("Hello, world!"); }
```

## Bash/Zsh/Fish (creating long pipes)
CAUTION needs to be exercised; on every keystroke the command will be executed immediately.
If you want a safer version of this, check out [Ultimate Plumber](https://github.com/akavel/up), which waits until you press Enter to execute.

So, can  `fzf` be used to execute shell commands, and output the result? Can it help with constructing long bash commands? Yes it can - but you should read the warning above before starting.

Thanks to a commenter on [this thread](https://news.ycombinator.com/item?id=20455857), the below command will cause your chosen shell to instantly evaluate any command you type. For me, this is extremely handy when constructing complicated `bash` queries using `sed`/`awk` etc, as I can previewing the output as I type:

```
: | fzf --multi --preview='bash -c {q}' --preview-window=up:70
```


# See also

https://github.com/junegunn/fzf