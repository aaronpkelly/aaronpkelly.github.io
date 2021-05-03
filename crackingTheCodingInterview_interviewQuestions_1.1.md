My first attempt focussed on *not using a data structure* at all, because when I read additional data structures, I was curious if I needed any.

So I decided on just reading a char at a time, and building up a String as I did it. If the char I was trying to add was in the string I was building, I'd return `false`.

```
<insert embed>
```

However, the hints for this exercise suggested to use a bit vector, which according to the javadocs is a faster implementation of a bit set (https://en.wikipedia.org/wiki/Bit_array).
	
Now I did try my best and attempt to implement it:
	
	/**
	 * A bitvector implementation of containsAllUniqueChars(String)
	 */
	public static boolean containsAllUniqueChars(long bits) {
		BitVector bvec = new BitVector();
		bset.	// stop!
	}
	
But I stopped there - this wasn't working, the IDE wasn't playing ball and allowing me to call the methods I expected, and to be honest I still didn't really understand much about the data structure, or why it was a better.
	
So I went to the book, and this was the solution that was offered:
	
    boolean isUniqueChars(String str) {
        int checker = 0;
        for (int i = 0; i < str.length(); i++) {
            int val = str.charAt(i) - 'a';
            if ((checker & (1 << val)) > 0) {
                return false;
            }
            checker |= (1 << val);
        }
        return true;
    }
	
Honestly, I'm not comfortable with bit-shifting, and I don't think it makes for maintainable code. Don't get me wrong - I *am* interested in learning about it, but practically, this isn't a solution that isn't going to be understood quickly by engineers that have to maintain this code in the future.

	 Java provides two right shift operators: 
	 >> does an _arithmetic_ right shift, and
	 
	 >>> does a _logical_ right shift. For positive numbers, a single logical right shift divides a number by 2, throwing out any remainders.
	 
	 Signed Right Shift [>>]

	Signed right shift moves all the bits by given number of positions to the right. However, it preserves the sign. Positive numbers remain positive and negative ones remain negative. Similar to left shift, the right shift of n positions is equivalent to division by 2^n. Or division by 2^n -1 in case of odd numbers.
	
	Unsigned Right Shift [>>>]

	Unlike the signed shift, the unsigned one does not take sign bits into consideration, it just shifts all the bits to the right and pads the result with zeros from the left. That means that for negative numbers, the result is always positive. Signed and unsigned right shifts have the same result for positive numbers.
	
Then there's this:

	|=
