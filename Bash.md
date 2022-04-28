# golden rules

[https://lobste.rs/s/iofste/please_stop_writing_shell_scripts](https://lobste.rs/s/iofste/please_stop_writing_shell_scripts)  

  

    Always use #!/usr/bin/env bash at the beginning of your scripts (change if you need something else, don’t rely on a particular path to bash though).  

    Always add set -eou pipefail after that.  

    Always run shellcheck.  

    Always run shfmt.  

    Always pay attention to what version of bash you need to support, and don’t go crazy with “new” features unless you can get teammates to upgrade (this is particularly annoying because Apple ships an older version of bash without things like associative arrays).  

    Always use the local storage qualifier when declaring variables in a function.  

    As much as possible, declare things in functions and then at the end of your script kick them all off.  

    Don’t use bash for heavy-duty hierarchical data munging…at that point consider switching languages.  

    Don’t assume that a bashism is more-broadly acceptable. If you need to support vanilla sh, then do the work.


# Use shellcheck!

Paste your script in here: https://www.shellcheck.net/

Or download the plugin? to check your scripts before execution

# Functions which should be put into my .functions

But i dont have time right now

## Passing a single argument to multiple programs
Given one input string, I wanted to:
- pass the input to two separate programs
- format my output, putting the result of the two commands on the same line

```
grep -e '.*com$' input | xargs -n 1 sh -c 'for arg do echo "marco ${arg}" 2>/dev/null; echo "polo ${arg}"; done' _
```

There'- a worked example of using this in [[Blocking ads and unwanted internet traffic]]


# Resources
There's loads of resources available