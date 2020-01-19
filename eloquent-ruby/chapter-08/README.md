# Chapter 08: Embrace dynamic typing

Keep in mind that Ruby classes don’t need to be related by inheritance to share a common interface; they only need to support the same methods.

Use dynamic typing. **Don’t** obscure your code with pointless checks to see whether _this_ really is an instance of _that_.

```
def initialize(title, author, content)
  raise "title isn't a String" unless title.kind_of? String
  raise "author isn't a String" unless author.kind_of? String
  raise "content isn't a String" unless content.kind_of? String
  @title = title
  @author = author
  @content = content
end
```
