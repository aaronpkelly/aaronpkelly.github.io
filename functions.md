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

- uncle bob