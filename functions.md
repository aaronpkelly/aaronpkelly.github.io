# naming
a name like`'testablehtml` is a terrible name for a function because it's a _noun_, it should be a verb

- how many arguments should a function have?  
  - ideally 0  
  - 1 or 2... yeah ok  
  - 3? how many ways to order 3 arguments? !3=6 (3 factorial). probably no more than this number of arguments  
  - if you have say 6 things to pass in to a function... and they are so cohesive they need to be passed in together... WHY aren't they an object?  
  - what types of objects should you never pass into a function? booleans!  
      - if you pass a boolean into a function, there must be an \`if\` statement in that function  
          - why not just have two different functions, for the two different cases?  
      - booleans generally tell you NOTHING and they are annoying  
      - maybe in some small cases a boolean would make sense (setting a switch)

- big functions hide classes
- what do you call a set of functions that manipulate a certain set of variables? a class

- in a function, going from the highest level of abstraction (e.g. `Wikipage wikePage`) to the lowest level of abstraction (e.g. `StringBuffer buffer`), is "rude. The programmer is being rude. The programmer is taking you from the heights to the depths in the span of one line".
- a fundamental rule for functions is that every line of a function should be at the same level of abstraction - one below the name of the function
- honestly, when you are writing code as a human, you naturally do oscillate from high to low-level code in a function, it's how your brain works
- that's fine for getting the code working, but what is rude is the function author left it that way, in this intermediate working state
- an _explanatory variable_ is to explain what its contents is
- functions that are smaller are easier to understand

- functions that are small are known as _polite_
- polite functions allow the reader to understand what the function does and _escape early_
  - they can understand within 3 seconds at a a very high level what the function does and get out early

- what is the ideal function size?
  - functions should not be 100 lines long
  - functions should hardly ever be 20 lines long
  - should functions fit on a screen? in the early days of programming, screens were 24 lines by 72 columns (punch cards have 80 columns, the last 8 were sequence numbers)
  - a function should do one thing
  - "a function does one thing if you can not meaningfully extract another function from it"
  - extract and extract until you cannot extract any more
    - thousands of little tiny litte functions? will I drown a sea of tiny little functions? no, you will not, because you will have to name these functions
    - by naming these functions, you will see that they belong in different classes, packages, and you will end up creating a semantic tree
  - how many indents ideally for a function? just one




- when you keep extracting and extracting and extracting, you find the TRUE object-oriented structure of the system that you're trying to design
- if you are extracting, and extracting...
  - what's in the parenthesis of an if statement? a function call! that tells you what you're testing! `if (isEmployeeTooOld()) { fireEmployee() }
  - what is the body of an ideal if statement? a function call! with a nice name! that tells you what the function is going to do
