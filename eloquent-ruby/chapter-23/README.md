# Chapter 23: Use method_missing to build flexible APIs

## magic methods

Creating interfaces for made up method names with method_missing.

```
class FormLetter < Document
  def replace_word( old_word, new_word )
    @content.gsub!( old_word, "#{new_word}" )
  end
  
  def method_missing( name, *args )
    string_name = name.to_s
    return super unless string_name =~ /^replace_\w+/
    old_word = extract_old_word(string_name)
    replace_word( old_word, args.first )
  end
  
  def extract_old_word( name )
    name_parts = name.split('_')
    name_parts[1].upcase
  end 
end
```

Extending `respond_to?` to support magic methods:

```
def respond_to?(name)
  string_name = name.to_s
  return true if string_name =~ /^replace_\w+/
  super
end
```

## OpenStruct

```
require 'ostruct'

author = OpenStruct.new
author.first_name = 'Stephen'
author.last_name = 'Hawking'

puts author.first_name
puts author.last_name
```
