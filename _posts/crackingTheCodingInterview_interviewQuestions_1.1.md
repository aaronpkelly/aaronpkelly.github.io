---
title: Cracking the Coding Interview - 1.1 <Is Unique
description:
date: 2021-05-11
tags:
  - programming
---

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

# adding and subtracting chars

So what's going on here?:

	int val = str.charAt(i) - 'a';
	
In summary, a numeric value of each character is being set using the ASCII value of the char  `a`, which is  `97`. This has the effect of making the values that are assigned to letters very predictable. For example, if passing in the string `abz`, the following values will be set:

	a = 0
	b = 1
	z = 25

These values will be used as *a counter* for how many times to **left bitshift** an integer with value `1`. Here is where this is used in the code:

	if ((checker & (1 << val)) > 0) {

The integer value `1` looks like this in bits: `00000000000000000000000001`. 

The `1 << val`  operation will have the effect of moving that `1` value left, and filling in the space it left with a zero. Here are some examples of how it looks:

	a: 00000000000000000000000000000001
	b: 00000000000000000000000000000010
	z: 00000010000000000000000000000000

So, this is a pretty nifty way to represent a letter as a `1` in a sea of `0`s. And because you are storing these bits inside an `int`, which is `32` bits, you have more that enough slots to store every letter of the alphabet as a bit.

But what happens if the letter is uppercase? Well lets see what values they get assigned:

	A = -32
	B = -31
	Z = -7
	
Negative values! What happens when you try to left-shifting by negative values? It causes the `1`s to move from left-to-right! And because the difference between `a` and `A` in the ASCII table is `32`... this is the exact width of an `int`, uppercase and lowercase letters end up in the exact same spot:

	A: 00000000000000000000000000000001
	B: 00000000000000000000000000000010
	Z: 00000010000000000000000000000000
		
So now we can finally look at the wider statement:

	if ((checker & (1 << val)) > 0) {
    	return false;
	}

This uses a _bitwise AND_ to compare the existing bits in the  `checker` variable with the incoming new bit position that the value in `val` wants to take. If the slot is already filled, it will return false.

Otherwise, the position has not yet been filled, so the new bit position will be computed, and the checker will record the new bit position inside the `checker` using a _bitwise OR_ operation:

	checker |= (1 << val);
	
If all the chars in the string are converted into bits, and all their bits can fit into their own slots inside a 32-bit integer, then the string is unique, and the function returns true. 
	
# supplementary info

# boolean algebra in java

## bitshifting
	
	Java provides two right shift operators: 
	 >> does an _arithmetic_ right shift, and
	 
	 >>> does a _logical_ right shift. For positive numbers, a single logical right shift divides a number by 2, throwing out any remainders.
	 
	 Signed Right Shift [>>]

	Signed right shift moves all the bits by given number of positions to the right. However, it preserves the sign. Positive numbers remain positive and negative ones remain negative. Similar to left shift, the right shift of n positions is equivalent to division by 2^n. Or division by 2^n -1 in case of odd numbers.
	
	Unsigned Right Shift [>>>]

	Unlike the signed shift, the unsigned one does not take sign bits into consideration, it just shifts all the bits to the right and pads the result with zeros from the left. That means that for negative numbers, the result is always positive. Signed and unsigned right shifts have the same result for positive numbers.
	
## data types

I'm just going to put this here from the [docs](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html):

> **char**: The `char` data type is a single 16-bit Unicode character. It has a minimum value of `'\u0000'` (or 0) and a maximum value of `'\uffff'` (or 65,535 inclusive).

> **int**: By default, the `int` data type is a 32-bit signed two's complement integer, which has a minimum value of -2^31 and a maximum value of 2^31-1. In Java SE 8 and later, you can use the `int` data type to represent an unsigned 32-bit integer, which has a minimum value of 0 and a maximum value of 2^32-1. Use the Integer class to use `int` data type as an unsigned integer.

> Literals of types `char` and `String` may contain any Unicode (UTF-16) characters. If your editor and file system allow it, you can use such characters directly in your code. If not, you can use a "Unicode escape" such as `'\u0108'` (capital C with circumflex), or `"S\u00ED Se\u00F1or"` (Sí Señor in Spanish). Always use 'single quotes' for `char` literals and "double quotes" for `String` literals. Unicode escape sequences may be used elsewhere in a program (such as in field names, for example), not just in `char` or `String` literals.

Because chars are just stored as their code point value, they are stored as numbers. This means you can do arithmetic with them!


## character encodings

### ascii

Via [Wikipedia](https://en.wikipedia.org/wiki/ASCII):

> Originally based on the English alphabet, ASCII encodes 128 specified characters into seven-bit integers as shown by the ASCII chart above.[11] Ninety-five of the encoded characters are printable: these include the digits 0 to 9, lowercase letters a to z, uppercase letters A to Z, and punctuation symbols. In addition, the original ASCII specification included 33 non-printing control codes which originated with Teletype machines; most of these are now obsolete,[12] although a few are still commonly used, such as the carriage return, line feed and tab codes.

> For example, lowercase i would be represented in the ASCII encoding by binary 1101001 = hexadecimal 69 (i is the ninth letter) = decimal 105

Here's the ASCII table (via `man ascii`) for the most common printed english characters in hex (left) and decimal (right):

          2 3 4 5 6 7       30 40 50 60 70 80 90 100 110 120
        -------------      ---------------------------------
       0:   0 @ P ` p     0:    (  2  <  F  P  Z  d   n   x
       1: ! 1 A Q a q     1:    )  3  =  G  Q  [  e   o   y
       2: " 2 B R b r     2:    *  4  >  H  R  \  f   p   z
       3: # 3 C S c s     3: !  +  5  ?  I  S  ]  g   q   {
       4: $ 4 D T d t     4: "  ,  6  @  J  T  ^  h   r   |
       5: % 5 E U e u     5: #  -  7  A  K  U  _  i   s   }
       6: & 6 F V f v     6: $  .  8  B  L  V  `  j   t   ~
       7: ' 7 G W g w     7: %  /  9  C  M  W  a  k   u  DEL
       8: ( 8 H X h x     8: &  0  :  D  N  X  b  l   v
       9: ) 9 I Y i y     9: '  1  ;  E  O  Y  c  m   w
       A: * : J Z j z
       B: + ; K [ k {
       C: , < L \ l |
       D: - = M ] m }
       E: . > N ^ n ~
       F: / ? O _ o DEL