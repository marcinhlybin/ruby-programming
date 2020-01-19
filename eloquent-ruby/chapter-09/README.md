# Chapter 09: Write specs!

Spec description in this book is deprecated.

Install rspec:

```
gem install rspec
```

Tests should be independent of one another. Avoid having one test rely on the output of a previous test. Don't create a file in one test and then expect it to be there in another.

## Stubs and mocks

A **stub** is an object that implements the same interface as one of the supporting cast members but returns canned answers when its methods are called.

_Stub code in a book is depreacated._

A **mock** is a stub with an attitude. Along with knowing what canned responses to return, a mock also knows which methods should be called and with what arguments.

`mocha` project for mocking and stubbing.
