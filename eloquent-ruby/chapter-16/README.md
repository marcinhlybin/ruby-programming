# Chapter 16: Use modules as mixins

Mixins allow you to easily share common code among otherwise unrelated classes.

## instance methods / include

All methods the module become **instance** methods:

```
module WritingQuality
  def number_of_cliches
  end
end


class Document
  Include WritingQuality
  # [...]
end
```

And then:

```
doc = Document.new
doc.number_of_cliches
```

## class methods / extend

All methods from the module become **class** methods. This code include the module into the singleton class:

```
module Finders
  def find_by_name(name)
    # Find a document by naem
  end
end

class Document
  class << self
    include Finder
  end
end
```

and then:

```
war_and_peace = Document.find_by_name('War And Peace')
```

Alias for doing that is **extend**.
