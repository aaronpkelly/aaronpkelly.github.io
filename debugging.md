# Debugging without tools (and just mindpower)
I really liked this article:
https://blog.regehr.org/archives/199

# conditional breakpoints

Here's a normal conditional breakpoint:

	if ((nextField.getName().equals("Specialhandlingforpayment1")) ||  
	(nextField.getName().equals("Rehabilitationmanagement1"))) {  
	return true;  
	} else { return false; }

## comparing values and returning a boolean

I had a problem returning a boolean value from a conditional breakpoint, where I was _comparing values_. Comparison functions normally return an _integer_, rather than a boolean (e.g. `<0` if less, `0` if equal, `>0` if greater, see [here](https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/lang/String.html#compareTo(java.lang.String)) for Java)

I think normally this is fine - my IDE would accept this -  but for some reason it wouldn' accept it a number comparison in the breakpoint.

You can convert your comparison integers into booleans by using an `assert` in your conditional breakpoint:

	Assert.isEquals(amount.toString(), "-208.57");
	Assert.isEquals(faii.getEffectiveDate().toString(), "02/10/2019 00:00:00 IST");  

Notes:

- to just use the Assert class name In IntelliJ, I had to "import" the assertion library by editing the breakpoint condition in the full-size breakpoint window, and clicking the code suggestion lightbulb  
- in some IDEs (Eclipse) you need to give the full package name (maybe it's easire to just give the full package name always):