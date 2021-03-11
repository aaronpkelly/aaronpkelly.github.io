# comments
- what is the purpose is a comment?
- the purpose of a comment is to explain code that can't explain itself
- some languages like FORTRAN limit function names to 6 characters, some assembly languages 4 chars, original basic 2 characters - 1 letter 1 number
- what are the right and wrong reasons for comments?
    - nothing is ever as helpful as a good comment
    - not all comments are bad, some comments are great
    - however, nothing can be quite as OBSCURING as a bad comment
 - we were taught to comment everything
- the proper use of a comment is to compensate for our failure to express ourselves in code
    - if we could perfectly express ourselves in code, we would not need comments
    - every use of a comment is a failure
    - why? comments lie, decay/degrade over time, they silently rot
- IDEs typically paint comments in soft, faded colours (I'm not going to hurt you, I'm harmless), nobody reads them, nobody updates them

- when you write bad code, don't comment it, clean it
- make the code express your intent
- explain yourself in code, not in comments
bad:
```
# checks if employee is eligible for benefits
if ((employee.HOURLY_WAGE) < 15 && (employee.EMPLOYED == true)) {
}
```

better - and no need for a comment, it explains itself!:

```
if (employee.isEligibleForBenefits()) {
	...
}
```

- some comments are helpful like a comment telling you what a REGEX matches etc
- or that a test will take a LONG time to run


- it takes longer to read a comment than it takes to read the code
	- this makes a comment useless, it makes it worse than useless
# see also

[[javadocs]]