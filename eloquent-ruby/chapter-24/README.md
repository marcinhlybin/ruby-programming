# Chapter 24: Update existing classes with monkey patching

## alias_method

```
class String
  alias_method :old_addition, :+

  def +( other )
    if other.kind_of? Document
      new_content = self + other.content
      return Document.new(other.title, other.author, new_content)
    end
    old_addition(other)
  end
end
```

## remove_method

```
class Document
  remove_method :word_count
end
```

You can also make it `public` or `private`.
