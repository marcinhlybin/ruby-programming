# Chapter 27: Invent internal DSL

DSL means **Domain specific languages**.

## XML

```
require "rexml/document"

File.open( 'fellowship.xml' ) do |f|
  doc = REXML::Document.new(f)
  REXML::XPath.each(doc, '/document/author') do |author|
    author.text = 'J.R.R. Tolkien' 
  end
  puts doc 
end
```

## instance_eval

```
class XmlRipper
  def initialize(&block) 
    @before_action = proc{} 
    @path_actions = {} 
    @after_action = proc{} 
    instance_eval( &block ) if block
  end

  # Rest of the class omitted
end
```

DSL:

```
ripper = XmlRipper.new do
  on_path( '/document/author' ) do |author|
    author.text = 'J.R.R. Tolkien'
  end
  after { |doc| puts doc }
end
ripper.run( 'fellowship.xml' )
```


