module Finders
  def find_by_name
    puts "Find by name"
  end
end

class Document
  include Finders
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def find
    find_by_name
  end
end

doc = Document.new('title', 'author', 'this is text')
doc.find
doc.find_by_name
pp Document.ancestors
