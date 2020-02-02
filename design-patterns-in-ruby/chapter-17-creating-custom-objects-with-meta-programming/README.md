# Chapter 17: Creating custom objects with Meta-programming

To determine whether an object is part of a composite as defined by CompositeBase is to look at its list of public methods:

```
def member_of_composite?(object, composite_name)
  public_methods = object.public_methods
  public_methods.include?("parent_#{composite_name}")
end
```

or

```
def member_of_composite?(object, composite_name)
  object.respond_to?("parent_#{composite_name}")
end
```

## Own attr_reader implmenetation

```
class Object
  def self.readable_attribute(name)
    code = %Q{
      def #{name}
        @#{name} end
    }
    class_eval(code)
  end
end

class BankAccount
  readable_attribute :balance
  def initialize(balance)
    @balance = balance
  end 
end
```

## Forwardable

```
class Engine
  def start_engine
    # Start the engine...
  end
  
  def stop_engine
    # Stop the engine
  end 
end

class Car
  extend Forwardable
  
  def_delegators :@engine, :start_engine, :stop_engine
  
  def initialize
    @engine = Engine.new
  end 
end
```
