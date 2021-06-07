---
title: Cracking the Coding Interview - 1.3 URLify
description:
date: 2021-06-04
tags:
  - cracking the coding interview
---

# urlify

Here's the description:

> 1.3 URLify: Write  method to replace all spaces in a string with '%20'. you may assume that the string has sufficient space at the end to hold the additional characters and that you are given the "true" length of the string. (Note: If implementing in Java, please use a character array so that you can perform this operation in place.).
> Hints: 53, 118

Before we begin - I diverged from the description slightly, because I got *really* excited and wondered if I could create a function that cloud URL-ify ALL different types of special characters, not just spaces.

So, to get a list of percent encodings, I went here: https://en.wikipedia.org/wiki/Percent-encoding.

Then, I looked around for a way to initialise a large number of paired values in a reasonably efficient way, and I found one (thank you [SO](https://stackoverflow.com/questions/6802483/how-to-directly-initialize-a-hashmap-in-a-literal-way)!):

    private static Map<String, String> url_percent_encoding = Map.ofEntries(
            entry(" ", "%20"),
            entry("!", "%21"),
            entry("#", "%23"),
            entry("$", "%24"),
            entry("%", "%25"),
            entry("&", "%26"),
            entry("'", "%27"),
            entry("(", "%28"),
            entry(")", "%29"),
            entry("*", "%2A"),
            entry("+", "%2B"),
            entry(",", "%2C"),
            entry("/", "%2F"),
            entry(":", "%3A"),
            entry(";", "%3B"),
            entry("=", "%3D"),
            entry("?", "%3F"),
            entry("@", "%40"),
            entry("[", "%5B"),
            entry("]", "%5D")
    );
	
You can ignore all this, as all you need to know to solve the question is that any occurrence of a space ` `  should be turned into `%20`, but I liked having the above map implemented in case I needed to do more complex URL encodings later.
	
# My solution

So - she wants me to use a character array. And in-place character replacement. Oh my. I haven't done such low-level character operations for a very long time. I admit, I sat on the couch for a while to try and think of a good algorithm that would shuffle and shift characters around inside an array once a space was detected.

Her hints for this problem were:

> 53, "It's often easiest to modify strings by going from the end of the string to the beginning.
> 118, "You might find you need to know the number of spaces. Can you just count them?"

Honestly, I didn't really go with the first hint, and the second hint did help a little as it made me pay attention to how many spaces things would have to move when a space was detected.

I created this JUnit test:

    @Test
    void TestIsURLified() {
        char[] expected = "Mr%20John%20Smith".toCharArray();
        assertTrue(java.util.Arrays.equals(expected, urlify( "Mr John Smith    ".toCharArray())));
    }
	
And came up with this code:

	// this map is actually a lot larger, just showing the short version
    private static Map<String, String> url_percent_encoding = Map.ofEntries(
            entry(" ", "%20")
			);

    public static char[] urlify(char[] url) {
        char[] encoded = url.clone();
        char[] space_encoded = url_percent_encoding.get(" ").toCharArray();
        
        for (int i = 0; i < encoded.length; i++) {
            if (encoded[i] == ' ') {

                //shift everything up by 2 places
                for (int j = encoded.length - 1; j >= i; j--) {
                    encoded[j] = encoded[j - 2];
                }
				
                // replace with encoded url
                encoded[i] = space_encoded[0];
                encoded[i + 1] = space_encoded[1];
                encoded[i + 2] = space_encoded[2];

                // start from next new char
                if ((i + 2) != encoded.length) {
                    i = i + 2;
                }
            }
        }
        return encoded;
    }
	
Every time a space is detected, all characters in the array moved up 2 places, by starting a loop running from the end of the string, replacing the character in the current position with the one 2 places lower than it, and finally stopping when it reaches the index of where the space was first detected. The URL encoding for space `%20` then has enough free slots to be inserted.

I was more or less happy with this solution.

# Gayle's solution

	public void replaceSpaces(char[] str, int trueLength) {
        int spaceCount = 0, newLength = 0, i = 0;

        for(i = 0; i < trueLength; i++) {
            if (str[i] == ' ')
                spaceCount++;
        }

        newLength = trueLength + (spaceCount * 2);
        str[newLength] = '\0';
        for(i = trueLength - 1; i >= 0; i--) {
            if (str[i] == ' ') {
                str[newLength - 1] = '0';
                str[newLength - 2] = '2';
                str[newLength - 3] = '%';
                newLength = newLength - 3;
            }
            else {
                str[newLength - 1] = str[i];
                newLength = newLength - 1;
            }
        }

After reviewing this code, I realised that I ignored the `trueLength` input parameter of the string, assuming that the size of the character array I was given had sufficient space at the end. I think this is why I decided to work from the beginning of the char array, rather than the end, I saw no danger. There are several lines of code that use this to compute a `newLength` value. that represents the `trueLength` with all the extra spaces needed, but I didn't bother with this. I was just going to modify the array I was given and return it.

I also realised that I was pretty much ignoring the whole point of the extra effort in this Java solution, where I was creating a clone of the original character array, rather than just modifying the original object in place.

But some things about this official solution really bothered me.

In Java, a String and a character array **are not the same thing**. However, in the Java solution, the character array is consistently referred to as a string, and is even given the identifier `char[] str` in the method signature!

In the solution, the insertion of the null character `\0` really bothered me. In Java, both Strings and character arrays are not null terminated. This is not necessary to do in Java (see [SO](https://stackoverflow.com/questions/2523284/java-string-replace-and-the-nul-null-ascii-0-character)).

The above two issues point to someone who has a C/C# understanding of strings, not Java strings, and have given a solution that works with that model.

# see also
[Cracking the Coding Interview](Cracking%20the%20Coding%20Interview.md)