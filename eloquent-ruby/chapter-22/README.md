# Chapter 22: Use method_missing for delegation

Selective delegation. `super` forwards the original method call (arguments and all) up the class hierarchy where it will eventually meet `NameError` exception.

```
class SuperSecretDocument
  # Lots of code omitted...
  DELEGATED_METHODS = [ :content, :words ]
  
  def method_missing(name, *args) check_for_expiration
    if DELEGATED_METHODS.include?( name )
      @original_document.send(name, *args)
    else
      super 
    end
  end 
end
```

## Object vs BasicObject

Defined class will support `.to_s` because it inherits from `Object` by default. 

To avoid that we can use:

```
class SuperSecretDocument < BasicObject
```

`BasicObject` is superclass of `Object` it is very stripped down.

## delegate.rb

```
require 'delegate'

class DocumentWrapper < SimpleDelegator
  def initialize(real_doc)
    super(real_doc)
  end
end
```
