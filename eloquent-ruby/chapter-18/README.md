# Chapter 18: Execute around with a block

Horrible logging code:

```
class SomeApplication
  # Rest of the class omitted...
  def do_something
    begin
      @logger.debug( 'Starting Document load' )
      @doc = Document.load( 'resume.txt' )
      @logger.debug( 'Completed Document load' )
    rescue
      @logger.error( 'Load failed!!' )
      raise
    end
  
    # Do something with the document...
    begin
      @logger.debug( 'Starting Document save' )
      @doc.save
      @logger.debug( 'Completed Document save' )
    rescue
      @logger.error( 'Save failed!!' )
      raise
    end 
  end
end
```

Better approach:

```
class SomeApplication
  def do_something
    with_logging('load') { @doc = Document.load('resume.txt') } 
    # Do something with the document

    with_logging('save') { @doc.save }
  end

  # Rest of the class omitted...

  def with_logging(description)
    begin
      @logger.debug("Starting #{description}")
      yield
      @logger.debug("Completed #{description}")
    rescue
      @logger.error("#{description} failed!")
      raise
    end
  end
end
```

```
