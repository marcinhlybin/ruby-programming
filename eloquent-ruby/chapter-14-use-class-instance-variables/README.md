# Chapter 14: Use class instance variables

```
class Document
  @default_font = :times

  class << self
    attr_accessor :default_font
  end

  end
```
