# origin

- Java started life as a language called Oak, invented by James Gosling, because of his hate for C++. He was working at Sun Microsystems, and they got a contract to write software for a set-top box. He invented a language for the purpose of the contract, then threw it in the bin
  - an accident of history resurrected his language, Sun wanted a language to appeal and sell hardware to programmers
  - C# is Java (pretty much!)

# history of features

great article (probably from hn): https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-16/

# repl

this is the easiest way I've found to run a REPL of a java program. Run this in one window:

	watch javac 'IsUnique.java && java IsUnique'

Then edit your file in another. You'll get output every 2s by default

# uis
## swing
It's used by IntelliJ to build their IDE - probably the only success story of swing :P

Oracle provide a Swing tutorial, with a sample file:
https://docs.oracle.com/javase/tutorial/uiswing/start/compile.html

Use IntelliJ's Swing UI Designer to build UIs:
- you will use IntelliJ's _forms_ to help you design the UI, which will create the needed classes
- right-click the elements on your forms, add actionlisteners, and code them up