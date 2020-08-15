# Software Development

# exception handling
Raising an exception is a a way for the author of the function to signal to the caller that an exceptional state occurred, which would not be obvious by just returning a value.

	From the point of view of the author of a routine, raising an exception is a useful way to signal that a routine could not execute normally - for example, when an input argument is invalid (e.g. value is outside of the domain of a function) or when a resource it relies on is unavailable (like a missing file, a hard disk error, or out-of-memory errors), or that the routine has detected a normal condition that requires special handling, e.g., attention, end of file. In systems without exceptions, routines would need to return some special error code. However, this is sometimes complicated by the semipredicate problem, in which users of the routine need to write extra code to distinguish normal return values from erroneous ones. 

That semi-predicate problem is interesting. If we choose to return integer values from a function, what value do we return to signal a problem? There is no value we can choose - because any value we pick could _also_ be a valid integer:

	In computer programming, a semipredicate problem occurs when a subroutine intended to return a useful value can fail, but the signalling of failure uses an otherwise valid return value.[1] The problem is that the caller of the subroutine cannot tell what the result means in this case. 
	
	The division operation yields a real number, but fails when the divisor is zero. If we were to write a function that performs division, we might choose to return 0 on this invalid input. However, if the dividend is 0, the result is 0 too. This means there is no number we can return to uniquely signal attempted division by zero, since all real numbers are in the range of division.
	
# See also
[[Development]]
[[workflows]]