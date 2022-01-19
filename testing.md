# the test pyramid

I really like this visualisation:

![Automated Testing Pyramid](https://www.aripd.com/assets/img/common/posts/automated-testing-pyramid.jpg "https://www.aripd.com/posts/testing/")

In regards to definitions, this coderanch article is neat: https://coderanch.com/wiki/718795/Unit-Testing

## unit test

> Unit Test: The smallest amount of testable code.   Often a single method/function, sans the use of other methods or classes.  Fast!  Thousands of unit tests can run in ten seconds or less!
>
> A unit test NEVER uses:
> - a database
> - an app server (or server of any kind)
> - file/network I/O or file system;
> - another application;
> - the console (System.out, System.err, etc.)
> - logging
> - most other classes (exceptions include DTO's, String, Integer, mocks and maybe a few others).
>
> Unit tests are almost always part of a regression suite.

## component test

> Component Test (aka acceptance tests): Running one component by itself.  These tests are written by by QA (and maybe managers, XP customers, etc.) using their own behaviour driven development (BDD) test tools (Cucumber, JBehave, Fitnesse, Specflow) This sort of test is not part of a regression suite and it is not run by JUnit.

## integration test


> Integration Test: Check the plumbing of the system. Check that the communication flow between two or more components are correct, and that they dance well. Usually written by architects, or dev/tech leads who understand the dynamics of the system well. Sometimes forms part of a regression suite.

## system test

> System Test: All components being run together.

## system acceptance test

>  System Acceptance Test (S.A.T.): A system test run in front of a crowd of people as part of a formal process.  The people in the room collectively decide if the system has met required criteria.

Where do the next ones come in?

# additional testing

## exploratory testing

> Exploratory testing (https://youtu.be/58jGpV2Cg50?t=5351): when you hand the system to a group of people and challenge them to break the system, you have a week. 

## regression suite

> Regression Suite: A collection of tests that can be run all at once.  An example would be that all tests put in a certain directory would all be run by JUnit.  A developer could run a unit test regression suite 20 times per day. Or, they might run a functional test regression suite twice a month.

## functional test

> Functional Test: Bigger than a unit and smaller than a full component test.
	Usually exercising several methods/functions/classes working together.  Permitted to take its sweet time:
	hundreds of tests could take hours to run. Most functional tests are part of a functional test regression suite.
	   Usually run from JUnit.

## component acceptance test

> Component Acceptance Test (C.A.T.): A component test run in front of a crowd of people
	   as part of a formal process.  The people in the room collectively decide if the component has met required criteria.

## stress testing

>	Stress Tests: Another program loads a component, some components, or possibly the entire
	   system.  I have seen some small stress tests worked into some regression functional tests - a pretty smart way to test
	   some concurrency code!


# mocking

>	Mock: A brain dead piece of code used in unit and functional tests to make sure that
	   a piece of code you are attempting to test does not use some other bit of production code.  A Mock class typically
	   overrides all of the public methods in a production class and is inserted somewhere that might try to use the
	   production class.  Sometimes a Mock class implements an interface and replaces production code that implements the same
	   interface.

# shunting

> 	Shunt: Kinda like a mock class that extends production code, only the purpose is NOT to
	   override ALL of the methods, but just enough so you can exercise some production methods, while mocking the rest of the
	   production methods.  Especially useful if you want to test a class that might try to use I/O.  Your shunt can override
	   the I/O methods while testing the non I/O methods. 
	   
# See also

[behaviour driven development (BDD)](behaviour%20driven%20development%20(BDD).md)