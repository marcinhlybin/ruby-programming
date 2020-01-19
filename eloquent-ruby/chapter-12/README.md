# Chapter 12: Create classes that undertand equality

There is `eql?` and `equal?` as well as `==` and `===`.

`===` comes out mostly for `case` statements.

`eql?` and `hash` to cope with hash tables. The `eql?` method returns true if obj and other refer to the same hash key.

Unlike the `==` operator which tests if both operands are equal, the `equal?` method checks if the two operands refer to the same object.

Implementation of `equal?` found in `Object` class is so good that there is no need to override `equal?`. Ever.

Use `kind_of?` instead `instance_of?` if you want to support subclasses in equal checks.

Classes treat the === method as an alias for `kind_of?`.

- `^` is XOR operator
- `a <=> b` evaluate to -1 if `a` is less than `b`, 0 if they are equal, and 1 if `a` is greater thatn `b`. Useful to sort a collection of objects

## On equality

We have defined equality relationships that violate the principal of symmetry: People tend to expect that if `a == b` then `b == a`.

There really is no magic elixir that will fix an asymmetrical equality relationship: You can either change the == methods on both classes so that they agree, or you can simply live with (and perhaps document) a less-than-intuitive, asymmetrical equality.

Asymmetry is also not the extent of our woes. Another built-in assumption we have about equality is that if `a == b` and `b == c`, then surely `a == c`. This transitive property is another expectation that is all too easy to violate.
