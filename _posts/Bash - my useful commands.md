# Passing a single argument to multiple programs
Given one input string, I wanted to:
- pass the input to two seperate programs
- format my output, putting the result of the two commands on the same line

```
grep -e '.*com$' input | xargs -n 1 sh -c 'for arg do echo "marco ${arg}" 2>/dev/null; echo "polo ${arg}"; done' _
```

There'- a worked example of using this in [[Blocking ads and unwanted internet traffic]]

# See also
[[Bash]]