# Chapter 11: Define Operators Respectfully

When you say:

```
sum = first + second
```

is actually:

```
sum = first.+(second)
```

You cannot override not operator, along with and, or, ||, and &&. They are built in to Ruby, and their behavior is fixed.
