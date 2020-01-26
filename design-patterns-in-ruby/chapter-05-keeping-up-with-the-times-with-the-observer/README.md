# Chapter 05: Keeping up with the times with the Observer

## employee-subject

- Ruby allows each clas to have exactly one superclass.
- Without using inheritance we can implement `Subject` as a module.
- We needed to call `super()` in nthe initialize method of `Employee` which has the effect of calling `initialize` in the `Subject` module.

## super()

Calling `super()` is one of the few places in Ruby where you need to supply the parentheses for an empty argument list. Calling super the way we do here, with the parentheses, calls the method in the superclass with no arguments. If you omit the parentheses, you will be calling super with the original set of arguments to the current method.

## Observable module

Prebuilt `Observable` module in the Ruby standard library.
