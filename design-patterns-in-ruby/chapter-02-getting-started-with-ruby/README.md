# Chapter 02: Getting started with Ruby

`attr_accessor` to create setters and getters.

`super(arg)` to use `initialize` from superclass.

## synchronize threads for debugging

```
@monitor = Monitor.new

@monitor.synchronize do
  # Only one thread at a time here
end
```
