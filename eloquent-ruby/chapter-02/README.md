# Chapter 02: Choose the right control structure

## Use modified forms where appropriate

```
@title = new_title unless @read_only
```

```
@title = new_title if @writeable
```

```
document.print_next_page while document.pages_available?
```

```
document.print_next_page until document.printed?
```

## Use each, not for

Each introduces new scope with private variables. For does not do this.

```
fonts.each do |font|
  puts font
end
```

## Case

Case statements use `===` for comparisons.

## Booleans

Only `false` and `nil` are false. **Everything** else is true.

`defined?` does not return true or false. It returns string.

```
until (next_object = get_next_object).nil?
  # Do something
end
```

## Other

```
@first_name = '' unless @first_name
```

```
@first_name ||= ''
```

Does not work with booleans.
