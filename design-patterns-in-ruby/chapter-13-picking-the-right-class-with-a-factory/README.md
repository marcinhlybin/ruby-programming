# Chapter 13: Picking the right class with a Factory

## const_get 

The const_get method used in IOFactory takes a string (or a symbol containing the name of a constant1 and returns the value of that constant. For example, if you pass const_get the string "PDFWriter", you will get back the class object of that name.

```
class IOFactory
  def initialize(format)
    @reader_class = self.class.const_get("#{format}Reader")
    @writer_class = self.class.const_get("#{format}Writer")
  end

  def new_reader
    @reader_class.new
  end

  def new_writer
    @writer_class.new
  end
end

html_factory = IOFactory.new('HTML')
html_reader = html_factory.new_reader

pdf_factory = IOFactory.new('PDF')
pdf_writer = pdf_factory.new_writer
```

## send()

```
adapter = "mysql"
method_name = "#{adapter}_connection"
Base.send(memthod_name, config)
```
