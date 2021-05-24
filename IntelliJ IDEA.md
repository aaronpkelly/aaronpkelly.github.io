# plugins I use

	$ ls ~/.local/share/JetBrains/IntelliJIdea2021.1/
	'Atom File Icons IDEA'     GitToolBox                          intellij-music               Kotlin                    sonarlint-intellij
	 aws-toolkit-jetbrains     go                                  intellij-pdf-viewer          MarioProgressBar.jar      StringManipulation
	 bashsupport-pro           GrepConsole                         intellij-rainbow-brackets    meta                      tab-shifter
	 brokenPlugins.json        gruvbox-theme                       intellij-randomness          pluginsXMLIds.json        TeXiFy-IDEA
	 brokenPlugins.json.etag   idea-conventional-commit            intellij-toml                pluginsXMLIds.json.etag   twitter-plugin-1.0.2.jar
	 CheckStyle-IDEA           idea-php-dotenv-plugin-2021.1.jar   jr-ide-idea                  PowerModeII               ZeroLengthRadar.jar
	 CodeGlance                idea-plugin-linessorter.jar         js-graphql-intellij-plugin   python
	'CSV Plugin'               IdeaVim                             json1.4.2.jar                realigner.jar
	 extensions.xml            ideolog                             JsonHelper                  'Shell Script'
	'Extra Icons'             'Indent Rainbow'                     Key-Promoter-X               Shifter.jar

# gui designer
## build and run using IntelliJ IDEA pls
when compiling forms made using the GUI designer, I haven't found a way for Gradle to generate the needed code into the source files.

Rather, I have to let intellij do it via _Settings -> Build, Execution and Deployment -> Build tools -> Gradle -> Build and run using: `IntelliJ IDEA`_

Then when you need to generate the form code, just use _Build -> Build Project_

It's unfortunate, but you can still run gradle tasks, it's just the _gradle build_ task won't generate form code. It should build everything else

## generate GUI into Java source code, rather than binary class files
in order for this to be packaged into a JAR, the source code needs to be in the Java files

Settings -> Editor -> GUI Designer -> Generate GUI into: `Java source code`

### getting the forms_rt.jar for compiling

so the IDEA ultimate install comes with a bunch of things, including JARs needed co compile the GUIs

on nixos these libraries aren't included in the project by default

you CAN download them from mavenCentral():
```
dependencies {
    compile 'com.intellij:forms_rt:7.0.3'
...
}
```

or use the JARs already in the IDEA installation in the Nix store (in a couple of places):
`/nix/store/hhj0836k1gbzaz30s1600w1myfy6a564-idea-ultimate-2020.2.1`


## building a fat jar

Basically, **a fat jar (also known as uber-jar) is a self-sufficient archive which contains both classes and dependencies needed to run an application.**

If you try to build the application into a jar using Gradle, you will get a small JAR file:

```
[nix-shell:~/src/task_helper/build/libs]$ unzip -l task_helper-1.0-SNAPSHOT.jar 
Archive:  task_helper-1.0-SNAPSHOT.jar
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  02-02-2021 00:05   META-INF/
       45  02-01-2021 23:54   META-INF/MANIFEST.MF
      623  02-01-2021 23:46   Dialog$1.class
      627  02-01-2021 23:46   Dialog$2.class
     3138  02-01-2021 23:46   Dialog.class
      600  02-01-2021 23:46   Dialog$3.class
      627  02-01-2021 23:46   Dialog$4.class
---------                     -------
     5660                     7 files

```

this is not enough to run the Swing GUI:

```
[nix-shell:~/src/task_helper/build/libs]$ java -jar task_helper-1.0-SNAPSHOT.jar 
Error: Unable to initialize main class Dialog
Caused by: java.lang.NoClassDefFoundError: com/intellij/uiDesigner/core/Spacer
```

you need to:
- run the application, passing in multiple JAR files... or,
- include all the files used during compilation inside a single FAT JAR, making it self-sufficient:

```
jar {
    manifest {
        attributes 'Main-Class': 'Dialog'
    }
    
	// make a FAT JAR
    from {
        configurations.compile.collect { it.isDirectory() ? it : zipTree(it) }
    }
}
```

## regenarating forms

Couple of ways:
- _Right click the form -> Recompile [FORM]_
- _Build -> Build project_





# gui form - what is it

https://www.jetbrains.com/help/idea/2020.2/creating-and-opening-forms.html#newForm

- creates a bound class
- no main method

# dialog - what is it

- creates a bound class
- creates a main method

# form snapshot - what is it

The Snapshot feature enables you to convert GUI forms created by some other means into IntelliJ IDEA GUI Designer Forms

# give me some more infos about the kind of related concepts JFrame and JDialog

`JFrame` is a normal window with its normal buttons (optionally) and decorations. `JDialog` on the other side does not have a maximize and minimize buttons and usually are created with `JOptionPane` static methods, and are better fit to make them modal (they block other components until they are closed).

But both inherit from Window, so they share much functionality.

# directory junction to back up scratches

used to get a directory backed-up by OneDrive

mklink /J "C:\\Users\\kellya\\OneDrive - FINEOS\\scratches\_backup" "C:\\Users\\kellya\\AppData\\Roaming\\JetBrains\\IntelliJIdea2020.3\\scratches"