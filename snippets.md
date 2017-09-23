# java
## functional interfaces
### comparator

Java8's comparator interface has some interesting new methods, such as
`thenComparing()` to form a series of comparisons:
```
PriorityQueue<Student> queue = new PriorityQueue<>(
    Comparator.comparing(Student::getCGPA).reversed()
    .thenComparing(Student::getName)
    .thenComparing(Student::getID)
    );
```
