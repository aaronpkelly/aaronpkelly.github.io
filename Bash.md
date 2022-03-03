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