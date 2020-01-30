# Chapter 12: Making sure there is only one with the Singleton

## Class variables

Class variables are attached to the whole inheritance hierarchy. Thus a class shares a common set of class variables with its superclass and all of its subclasses.

## Class methods

```
class SomeClass
  def self.class_level_method
    puts('hello from the class method')
  end
end
```

or

```
class SomeClass
  def SomeClass.class_level_method
    puts('hello from the class method')
  end
end
```

## Class as singleton

```
class ClassBasedLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open('log.txt', 'w')
  @@level = WARNING

  def self.error(msg)
    @@log.puts(msg)
    @@log.flush
  end

  # ...
end

ClassBasedLogger.level = ClassBasedLogger::INFO
ClassBasedLogger.info('Computer wins chess game')
```
