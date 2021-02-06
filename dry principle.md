# DRY principle

\- don't repeat yourself  
\- avoid duplication as much as possibly because it's sloppy  
  - move the copied code into some function and call the function  
\- but what do you do.... when it's not the code that's duplicated - it's the LOOPs?  
  - e.g. a big nested set of loops to walk some configuration data structure, then perform some operation at the end  
  - a solution is to turn THAT LOOP into a function, and then pass in a parameter/lambda that has the processing instructions