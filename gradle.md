the docs are frustrating and there's too much of them

# starting a new gradle project

if you want to start a new gradle project, run `gradle init` and follow the prompts

check the samples section: https://docs.gradle.org/current/samples/index.html

## what files are generated (Gradle 6.6)
### basic

```
[nix-shell:~/src/tmp]$ gradle init
> Task :wrapper

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 1

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 1

Project name (default: tmp): 


> Task :init
Get more help with your project: https://guides.gradle.org/creating-new-gradle-builds

BUILD SUCCESSFUL in 7s
2 actionable tasks: 2 executed

[nix-shell:~/src/tmp]$ find .
.
./build.gradle
./.gitattributes
./.gitignore
./gradlew
./settings.gradle
./gradlew.bat
./.gradle
./.gradle/vcs-1
./.gradle/vcs-1/gc.properties
./.gradle/configuration-cache
./.gradle/configuration-cache/gc.properties
./.gradle/checksums
./.gradle/checksums/checksums.lock
./.gradle/buildOutputCleanup
./.gradle/buildOutputCleanup/buildOutputCleanup.lock
./.gradle/buildOutputCleanup/outputFiles.bin
./.gradle/buildOutputCleanup/cache.properties
./.gradle/6.6
./.gradle/6.6/vcsMetadata-1
./.gradle/6.6/fileChanges
./.gradle/6.6/fileChanges/last-build.bin
./.gradle/6.6/fileHashes
./.gradle/6.6/fileHashes/fileHashes.lock
./.gradle/6.6/fileHashes/fileHashes.bin
./.gradle/6.6/executionHistory
./.gradle/6.6/executionHistory/executionHistory.bin
./.gradle/6.6/executionHistory/executionHistory.lock
./.gradle/6.6/gc.properties
./gradle
./gradle/wrapper
./gradle/wrapper/gradle-wrapper.properties
./gradle/wrapper/gradle-wrapper.ja
```

### application

```
[nix-shell:~/src/tmp]$ gradle init
> Task :wrapper

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
  
Enter selection (default: basic) [1..4] 2

Select implementation language:
  1: C++
  2: Groovy
  3: Java
  4: Kotlin
  5: Swift
Enter selection (default: Java) [1..5] 3

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 1

Select test framework:
  1: JUnit 4
  2: TestNG
  3: Spock
  4: JUnit Jupiter
Enter selection (default: JUnit 4) [1..4] 1

Project name (default: tmp): 

Source package (default: tmp): 

> Task :init
Get more help with your project: https://docs.gradle.org/6.6/userguide/tutorial_java_projects.html

BUILD SUCCESSFUL in 30s
2 actionable tasks: 2 executed

[nix-shell:~/src/tmp]$ find .
.
./src
./src/test
./src/test/resources
./src/test/java
./src/test/java/tmp
./src/test/java/tmp/AppTest.java
./src/main
./src/main/resources
./src/main/java
./src/main/java/tmp
./src/main/java/tmp/App.java
./gradle
./gradle/wrapper
./gradle/wrapper/gradle-wrapper.properties
./gradle/wrapper/gradle-wrapper.jar
./.gitignore
./gradlew
./gradlew.bat
./.gradle
./.gradle/vcs-1
./.gradle/vcs-1/gc.properties
./.gradle/buildOutputCleanup
./.gradle/buildOutputCleanup/outputFiles.bin
./.gradle/buildOutputCleanup/buildOutputCleanup.lock
./.gradle/buildOutputCleanup/cache.properties
./.gradle/checksums
./.gradle/checksums/checksums.lock
./.gradle/6.6
./.gradle/6.6/vcsMetadata-1
./.gradle/6.6/fileChanges
./.gradle/6.6/fileChanges/last-build.bin
./.gradle/6.6/gc.properties
./.gradle/6.6/fileHashes
./.gradle/6.6/fileHashes/fileHashes.lock
./.gradle/6.6/fileHashes/fileHashes.bin
./.gradle/6.6/executionHistory
./.gradle/6.6/executionHistory/executionHistory.bin
./.gradle/6.6/executionHistory/executionHistory.lock
./.gradle/configuration-cache
./.gradle/configuration-cache/gc.properties
./.gitattributes
./settings.gradle
./build.gradle
```

### library

```
[nix-shell:~/src/tmp]$ gradle init
> Task :wrapper

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 3

Select implementation language:
  1: C++
  2: Groovy
  3: Java
  4: Kotlin
  5: Scala
  6: Swift
Enter selection (default: Java) [1..6] 3

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 1

Select test framework:
  1: JUnit 4
  2: TestNG
  3: Spock
  4: JUnit Jupiter
Enter selection (default: JUnit 4) [1..4] 1

Project name (default: tmp): 

Source package (default: tmp): 


> Task :init
Get more help with your project: https://docs.gradle.org/6.6/userguide/java_library_plugin.html

BUILD SUCCESSFUL in 10s
2 actionable tasks: 2 executed

[nix-shell:~/src/tmp]$ find .
.
./settings.gradle
./gradlew
./.gitattributes
./src
./src/main
./src/main/java
./src/main/java/tmp
./src/main/java/tmp/Library.java
./src/main/resources
./src/test
./src/test/resources
./src/test/java
./src/test/java/tmp
./src/test/java/tmp/LibraryTest.java
./.gitignore
./build.gradle
./gradle
./gradle/wrapper
./gradle/wrapper/gradle-wrapper.jar
./gradle/wrapper/gradle-wrapper.properties
./gradlew.bat
./.gradle
./.gradle/configuration-cache
./.gradle/configuration-cache/gc.properties
./.gradle/vcs-1
./.gradle/vcs-1/gc.properties
./.gradle/buildOutputCleanup
./.gradle/buildOutputCleanup/outputFiles.bin
./.gradle/buildOutputCleanup/buildOutputCleanup.lock
./.gradle/buildOutputCleanup/cache.properties
./.gradle/checksums
./.gradle/checksums/checksums.lock
./.gradle/6.6
./.gradle/6.6/vcsMetadata-1
./.gradle/6.6/gc.properties
./.gradle/6.6/executionHistory
./.gradle/6.6/executionHistory/executionHistory.bin
./.gradle/6.6/executionHistory/executionHistory.lock
./.gradle/6.6/fileChanges
./.gradle/6.6/fileChanges/last-build.bin
./.gradle/6.6/fileHashes
./.gradle/6.6/fileHashes/fileHashes.bin
./.gradle/6.6/fileHashes/fileHashes.lock
```


### gradle plugin

```
[nix-shell:~/src/tmp]$ gradle init
> Task :wrapper

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 4

Select implementation language:
  1: Groovy
  2: Java
  3: Kotlin
Enter selection (default: Java) [1..3] 2

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 1

Project name (default: tmp): 

Source package (default: tmp): 


> Task :init
Get more help with your project: https://guides.gradle.org?q=Plugin%20Development

BUILD SUCCESSFUL in 7s
2 actionable tasks: 2 executed

[nix-shell:~/src/tmp]$ find .
.
./.gradle
./.gradle/buildOutputCleanup
./.gradle/buildOutputCleanup/outputFiles.bin
./.gradle/buildOutputCleanup/buildOutputCleanup.lock
./.gradle/buildOutputCleanup/cache.properties
./.gradle/configuration-cache
./.gradle/configuration-cache/gc.properties
./.gradle/checksums
./.gradle/checksums/checksums.lock
./.gradle/6.6
./.gradle/6.6/fileHashes
./.gradle/6.6/fileHashes/fileHashes.bin
./.gradle/6.6/fileHashes/fileHashes.lock
./.gradle/6.6/executionHistory
./.gradle/6.6/executionHistory/executionHistory.bin
./.gradle/6.6/executionHistory/executionHistory.lock
./.gradle/6.6/fileChanges
./.gradle/6.6/fileChanges/last-build.bin
./.gradle/6.6/vcsMetadata-1
./.gradle/6.6/gc.properties
./.gradle/vcs-1
./.gradle/vcs-1/gc.properties
./gradlew.bat
./src
./src/main
./src/main/java
./src/main/java/tmp
./src/main/java/tmp/TmpPlugin.java
./src/main/resources
./src/test
./src/test/java
./src/test/java/tmp
./src/test/java/tmp/TmpPluginTest.java
./src/test/resources
./src/functionalTest
./src/functionalTest/java
./src/functionalTest/java/tmp
./src/functionalTest/java/tmp/TmpPluginFunctionalTest.java
./settings.gradle
./gradle
./gradle/wrapper
./gradle/wrapper/gradle-wrapper.properties
./gradle/wrapper/gradle-wrapper.jar
./build.gradle
./.gitattributes
./gradlew
./.gitignore
```