# Chapter 20: Use hooks to keep your program informed

## included hook

`.included` hook works like `.inherited` but for modules.

```
module UsefulMethods
  module ClassMethods
    def a_class_method
    end 
  end

  def self.included( host_class )
    host_class.extend( ClassMethods )
  end
end

class Host
  include UsefulMethods
end
```

## at_exit hook

Before Ruby exists. Can be run several times. Last in / first out.

```
at_exit do
  puts "Have a nice day"
end
```

## other hooks

`method_missing`, `method_added`, `trace_var`, 

`set_trace_func` runs whenever a method gets called or retuns, whenever a class definition is opened with the `class` keyword or closed with an `end`, whenever an exception get raised etc.

