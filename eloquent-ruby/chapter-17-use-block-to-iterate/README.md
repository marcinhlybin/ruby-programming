# Chapter 17: Use block to iterate

## Iterators

```
def each_word
  words.each { |word| yield(word) }
end
```

## Enumerable

```
class Document
  include Enumerable

  def each 
    words.each { |word| yield(word) }
  end
end
```

Adds `.include?`, `.find`, `.find_all` and other methods.

## Enumerator

```
doc = Document.new('example', 'russ', "We are all characters")
enum = Enumerator.new( doc, :each_character )

puts enum.count
```
