# Chapter 04: Take advantage of Ruby's smart strings

## `""` vs `''`

Double quotes are interpolated. Also they support escape sequenes like `\n` or `\t`.

- %q{} is `''`
- %Q{} is `""`

## Here documents

```
doc = <<~EOF
  This is the beginning of here document.
  And this is the end.
  EOF
```

- `<<-EOF` means that `EOF` delimiter does not have to start in the beginning of the line and indentation is preserved.
- `<<~EOF` means that `EOF` delimiter does not have to start in the beginning of the line and indentation is stripped.

## Remove characters

`.lstrip`, `.rstrip`, `.chop`, `.chomp`

Optional `!` version to manipulate inline.

## Substitution

`.sub` and `.gsub`

Optional `!` version to manipulate inline.

## Iteration

`.each_char`, `.each_byte`, `.each_line`

```
@content.each_line { |line| puts line }
```

## Strings are mutable

```
name1 = "Marcin"
name2 = name1

name1[0] = "m"
# name1 and name2 will be "marcin"

name1 = name1.upcasenam
# name1 and name2 are now two separate strings
```
