---
layout: page
title: snippets
permalink: /snippets/
---
many of these snippets are taken from the following sites:
- hackerrank.com
- ...

# java
## functional interfaces
### comparator

traditional:

```
private final Comparator<Student> studentComparator = new Comparator<Student>() {
    @Override
    public int compare(Student first, Student second) {
        Double firstCGPA = first.getCGPA();
        Double secondCGPA = second.getCGPA();

        if (Objects.equals(firstCGPA, secondCGPA)) {
            String firstName = first.getName();
            String secondName = second.getName();

            if (firstName.equals(secondName)) {
                Integer firstID = first.getID();
                Integer secondID = second.getID();

                return firstID.compareTo(secondID);
            }

            return firstName.compareTo(secondName);
        }

        return secondCGPA.compareTo(firstCGPA);
    }
};
```

Java8's comparator interface has some interesting new methods, such as
`thenComparing()` to form a series of comparisons:
```
PriorityQueue<Student> queue = new PriorityQueue<>(
    Comparator.comparing(Student::getCGPA).reversed()
    .thenComparing(Student::getName)
    .thenComparing(Student::getID)
    );
```
