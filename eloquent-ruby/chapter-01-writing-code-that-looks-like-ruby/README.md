# Chapter 01: Writing code that looks like Ruby

- Recommended tab size in code editor is 2
- Write descriptive code and add comments only when it is helpful or neccessary

## Style guide

- CamelCase for classes
- Snakes for everything else
- Uppercase for constants

## Folding up code blocks

```
10. times { |n| puts "The number is #{n}" }
```

vs

```
10.times do |n|
  puts "The number is #{n}"
  puts "Twice the number is #{n*2}
end
```

## Parenthesis

Not using parenthesis usually makes a code easier to read.

```
require 'set'
s1 = Set.new [1, 2]
s2 = [1, 2].to_set
s1 == s2
```
