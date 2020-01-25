# Chapter 03: Take advantage of Ruby's smart collections

## Lists

```
poem_words = ['twinkle', 'little', 'star', 'how', 'I', 'wonder']
```

```
poem_words = %w{twinkle little star how I wonder}
```

## Hashes

```
freq = { "I" => 1, "don't" => 1, "like" => 1, "spam" => 963 }
```

```
book_info = { :first_name => 'Russ', :last_name => 'Olsen' }
```

```
book_info = { first_name: 'Russ', last_name: 'Olsen' }
```

```
movie = { title: '2001', genre: 'sci fi', ratint: 10 }
movie.each { |name, value| puts "#{name} => #{value}" }
```

## Set

```
require 'set'
word_set = Set.new(words)
```

## Splat args

```
class Document
  def add_authors(*names)
    @author += " #{names.join(' ')}
  end
end

doc.names('Strunk', 'White')
```

## Array API

### find_index

```
def index_for(word)
  words.find_index { |this_word| word == this_word }
end
```

### map

```
doc.words.map { |word| word.size }
```

```
lower_case_words = doc.words.map { |word| word.downcase }
```

### inject

Inject takes a block and calls the block with each element of the collection. Unlike `each`, `inject` passes in two arguments to the block: along with each element, you get the current result.

```
def average_word_length
  total = words.inject(0.0){ |result, word| word.size + result }
  total / word_count
end
```

### each_index / delete_if

THIS WILL NOT WORK
You are removing from array while iterating.

```
array = [0, -10, -9, 5, 9]
array.each_index { |i| array.delete_at(i) if array[i] < 0 }
pp array
```

Fix:

```
array = [0, -10, -9, 5, 9]
array.delete_if { |x| x < 0 }
pp array
```

### push `<<`

```
unique = []
words = %w{bunch bunch bunch words repeated repeated unique unique unique}
words.each { |word| unique  word unless unique.include?(word) }
```
