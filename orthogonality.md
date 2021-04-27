A term I first heard while reading [[The Practical Programmer]].

It's a critical concept that helps you design systems that are easy to:
- design
- build
- test
- extend

The term is borrowed from geometry - two lines are orthogonal if they meet at right angles (e.g. axes on a graph). In vector terms, these lines are *independent*. Move along one of the lines, and your position projected onto the other line **doesn't change**.

Translated to computing, it translates to *independence* or *decoupling*. 
Changes in one module does not affect any of the others. Swapping out the database code will not affect the GUI code, and vice-versa.

Non-orthogonal systems are complex to change and control, as all the components are highly interdependent.