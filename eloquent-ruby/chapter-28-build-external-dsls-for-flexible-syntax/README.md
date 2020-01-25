# Chapter 28: Build external DSLs for flexible syntax

## treetop

A language for describing languages.

## split

Split can take regular expression as an argument.
For ERB templating:

```
SplitRegexp = /(<%%)|(%%>)|(<%=)|(<%#)|(<%)|(%>)|(\n)/
```
