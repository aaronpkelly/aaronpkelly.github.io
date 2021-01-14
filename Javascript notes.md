# Javascript notes
# concepts
## asynchronous programming
"dealing with events that take time"

Most of this content is taken from this fantastic [stack overflow answer](https://stackoverflow.com/questions/14220321/how-do-i-return-the-response-from-an-asynchronous-call?noredirect=1&lq=1). Here's the intro:

	JavaScript runs in the UI thread of the browser and any long-running process will lock the UI, making it unresponsive. Additionally, there is an upper limit on the execution time for JavaScript and the browser will ask the user whether to continue the execution or not.

	All of this is a really bad user experience. The user won't be able to tell whether everything is working fine or not. Furthermore, the effect will be worse for users with a slow connection.

	There are three different solutions that are all building on top of each other:

    - Promises with async/await (ES2017+, available in older browsers if you use a transpiler or regenerator)
    - Callbacks (popular in node)
    - Promises with then() (ES2015+, available in older browsers if you use one of the many promise libraries)
	
### promises with async/await

### callbacks
https://developer.mozilla.org/en-US/docs/Glossary/Callback_function

### promises with then

# Books
 https://eloquentjavascript.net/ - https://todo.sr.ht/~aaronkelly/programming/6
# Courses
The Modern JavaScript Tutorial https://javascript.info/ (via https://news.ycombinator.com/item?id=25333350 )

https://www.c0d3.com/curriculum (via HN)

https://learnjsthehardway.com/ (Zed Shaw)

https://www.freecodecamp.org/learn

https://www.executeprogram.com/courses/typescript

https://www.executeprogram.com/courses/modern-javascript

https://www.executeprogram.com/courses/javascript-concurrency

https://www.executeprogram.com/courses/javascript-array