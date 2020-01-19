# Chapter 13: Get the behavior you need with singleton and class methods

In Ruby, a **singleton method** is a method that is defined for exactly one object instance. Do not mix it with Singleton Pattern.

```
stub_printer = Object.new

def stub_printer.available?
  true
end

def stub_printer.render(content)
  nil
end
```

or alternatively:

```
stub_printer = Object.new

class << stub_printer
  def available?
    true
  end

  def render
    nil
  end
end
```
