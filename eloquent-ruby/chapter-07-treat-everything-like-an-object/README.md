# Chapter 07: Treat everything like an object - beacuse everyting is

## Private methods

```
private
def word_count
  words.size
end

# Everything below also private
```

```
private def word_count
  words.size
end
```

```
def word_count
  words.size
end

private :word_count
```

Private methods work in subclasses.

## Protected methods

Any instance of a class can call a protected method of any other instance of the class.
