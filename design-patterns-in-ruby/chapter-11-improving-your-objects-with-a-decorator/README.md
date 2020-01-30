# Chapter 11: Improving your objects with a Decorator

```
require 'forwardable'

class WriterDecorator
  extend Forwardable

  def_delegators :@real_writer, :write_line, :rewid, :pos, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end
```

## alias

Rename old method and create a replacement:

```
w = SimpleWriter('out')

class << w

  alias old_write_line write_line

  def write_line(line)
    old_write_line("#{Time.new}: #{line}")
  end
end
```

# extend

The `extend` method inserts a module into an object's inheritance tree before its regular class.

```
module TimeStampingWriter
  def write_line(line)
    super("#{Time.new}: #{line}")
  end
end

w = SimpleWriter.new('out')
w.extend(NumberingWriter)
w.extend(TimstampingWriter)

w.write_line('hello')
```
