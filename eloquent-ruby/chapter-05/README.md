# Chapter 05: Find the right string with regular expressions

Returns index 6 at which the match is found:

```
puts '10:24 PM' =~ /PM/`
puts  /PM/ =~ '10:24 PM'`
```

The `=~` operator is also ambidextrous: It doesn’t matter whether the string or the regular expression comes first.

## Regexp

- `\A` means the beginning.
- `\z` means the end.
- `^` means the beginning of the string or the beginning of any line within the string.
- `$` means the end of the string or the end of any line within the string.
- `.*` will not catch new line. Use `/m` multiline modifier.

`^` character is called **circumflex**, caret or hat.
