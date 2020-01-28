# Chapter 08: Getting things done with Commands

Use `Proc` object to pass action to the button:

```
class SlickButton
  attr_accessor :command

  def initialize(&block)
    @command = block
  end

  def on_button_push
    @command.call if @command
  end
end

new_button = SlickButton.new do
  # Create a new document
end
```

If you simply want a command that executes some straightforward actions when it is run, by all means use a `Proc` object. But if you are doing something fairly complex, if you need to create a command that will carry arround a log of state information or that naturally decomposes into several methods, by all means create a command class.
