# Chapter 09: Filling in the gaps with the Adapter

## Adapter class

```
class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end

  def color
    return @bto.colour
  end
end
```

## Modyfying a class

```
require 'british_text_object'

class BritishTextObject
  def color
    return colour
  end
```

## Modyfying a single instance

```
bto = BritishTextObject.new(...)

class << bto
  def color
    colour
  end
```

or

```
def bto.color
  colour
end
```
