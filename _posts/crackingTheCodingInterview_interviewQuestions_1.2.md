---
title: Cracking the Coding Interview - 1.2 Check Permutation
description:
date: 2021-05-19
tags:
  - cracking the coding interview
---

# 1.2 Check Permutation

My test class:

    @Test
    void TestIsPermutation() {
        // https://www.anagrammy.com/anagrams/faq6.html
        assertTrue(isPermutation("conversationalists", "conservationalists"));
        assertTrue(isPermutation("courtmartial", "matriculator"));
        assertFalse(isPermutation("splonk", "flarb"));
        assertFalse(isPermutation("radar", "raydar"));
    }
	
And my implementation:

    /**
     * Check Permutation: Given two strings, write a method to decide if one is a permutation of the other
     * Hints:
     * - 1: Describe what it means for to strings to be a permutation of each other. Now, look at that definition you provided. Can you check the strings against that definition?
     * - 84: There is one solution that is O(N log N) time. Another solution uses some space, bu is O(N) time.
     * - 122: Could a hash table be useful?
     * - 131: Two strings that are permutations should have the same characters, but in different orders. Can you make the orders the same?
     *
     * @return true if the strings are permutations of each other (aka anagrams)
     * @see Cracking the Coding Interview: Interview Questions - 1.2 Check Permutation
     */
    public static boolean isPermutation(String str0, String str1) {
        ArrayList<Character> lst = new ArrayList<>();
        boolean rst = false;

        for (char c: str0.toCharArray()) {
            lst.add(c);
        }

        for (char c: str1.toCharArray()) {
            if (lst.contains(c)) { ;
                System.out.println(lst);
            } else {
                break;
            }

            if (lst.isEmpty()) rst = true;
        }
        return rst;
    }

Instead of checking if two strings are *permutations*, I think *anagrams* is better wording :)

My solution was the first one that came to my mind:
- create a list of characters of the first string
- subtract every character in the second string from the first
- if a character is not found exist, the two strings are not permutations of each other (anagrams)

I only read Gayle's hints after I completed the question, and they got me thinking:
- using a hash table seems like a similar approach - the key could be the character, with the number of occurrences of that character being the value
- as for the big O:
	- what is the complexity of my solution?
	- O(N log N): what could this solution be?
	- O(N): what could this solution be!?

# see also
[Cracking the Coding Interview](Cracking%20the%20Coding%20Interview.md)