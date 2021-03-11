# Software Development
## about

- software is everywhere and runs everything
- who writes that software? programmers
- other people think they rule the world, and then they give those rules to us
  - so you can say... we rule the world. we write the rules that runs on the machines
- does society understand how dependent they are on software? or how dependent they are on us? no
  - society only realises we exist when software fails or people die
- we don't have a profession because our trade/craft does not "profess" anything at this point in time - we do not have a set of stated set of ethical/moral standards that we follow - doctors, lawyers, architects do
  - what are our values? what do we hold dear? one of those thing should be "the cleanliness of code"

- on a greenfield project, features come fast - couple of days. A year later, a feature could take six months
- scared to touch a line of code
- Why do programmers slow down? Because they make a mess, and bottom out at 1% of their productivity. no feature can get done, it takes 6 months and it doesn't work
- Why do they make a mess? Because they want to go fast
- whats a typical manager response? add more people. but what happens? the team slows down. the new people suck the life out of the old people. and who's training the new people? the old people who made the mess in the first place, and the old code that trains the new people (when they read it - "oh, I see how things are done around here"

- if you could keep the code clean, you can add features in a reasonable amount of time
- the fact that you got code working, that's half the job
  - Once the code works, that's when you have to clean it
- Nobody writes clean code first, it's just too hard to get code to work. Once the code works, it will be a mess. We don't think like that as humans, we piece it together with wire and scotch tape. That's why we need to clean it
- How much time invested in cleaning it? Same amount writing it.
  - That's the problem, nobody wants to put the effort in. They think they're done when it works. YOUR NOT DONE WHEN IT WORKS. YOU'RE DONE WHEN ITS RIGHT.


- whats your job? getting code to work is 1/2 of your job
- the other half is writing code that others can maintain
- if you give me code that works but I can't understand it, as soon as the requirements change its useless
- on the other hand if you give me code that does not work, but I can understand it, I can make it work.
- it is much more important that your *peers* are able to understand the code you wrote, than the computer

# exception handling
Raising an exception is a a way for the author of the function to signal to the caller that an exceptional state occurred, which would not be obvious by just returning a value.

	From the point of view of the author of a routine, raising an exception is a useful way to signal that a routine could not execute normally - for example, when an input argument is invalid (e.g. value is outside of the domain of a function) or when a resource it relies on is unavailable (like a missing file, a hard disk error, or out-of-memory errors), or that the routine has detected a normal condition that requires special handling, e.g., attention, end of file. In systems without exceptions, routines would need to return some special error code. However, this is sometimes complicated by the semipredicate problem, in which users of the routine need to write extra code to distinguish normal return values from erroneous ones. 

That semi-predicate problem is interesting. If we choose to return integer values from a function, what value do we return to signal a problem? There is no value we can choose - because any value we pick could _also_ be a valid integer:

	In computer programming, a semipredicate problem occurs when a subroutine intended to return a useful value can fail, but the signalling of failure uses an otherwise valid return value.[1] The problem is that the caller of the subroutine cannot tell what the result means in this case. 
	
	The division operation yields a real number, but fails when the divisor is zero. If we were to write a function that performs division, we might choose to return 0 on this invalid input. However, if the dividend is 0, the result is 0 too. This means there is no number we can return to uniquely signal attempted division by zero, since all real numbers are in the range of division.
	
# See also
[[Development]]
[[workflows]]