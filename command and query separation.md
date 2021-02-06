command and query separation:  
  
\- "a function that returns void must have a side effect"  
  - if it doesn't have a side-effect then there's no point in calling it  
\- a function  
\- commands change the state of the system return \`void\`  
\- any function that returns a value \_by convention\_ will not change the state of the system  
  - you know it's safe to call, it will leave the system in the same state you found it in  
\- a good convention to follow, allows you to keep track of side effects

- coding a better world together (with uncle bob)