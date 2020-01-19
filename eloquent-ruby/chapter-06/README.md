# Chapter 06: Use symbols to stand for something

```
the_string = :all.to_s
the_symbol = 'all'.to_sym
```

Broken code:

```
person = {}
person[:name] = 'russ'
person[:eyes] = 'misty blue'

puts "Name: #{person['name']} Eyes: #{person['eyes']}"
```

Rails provides `HashWithIndifferentAccess` helper to avoid these kind of mistakes.
