class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end  

  def Document.explain
    puts "self is #{self}"
    puts "and its class is #{self.class}"
  end
end

doc1 = Document.new('Title', 'Author', 'This is content')
doc2 = Document.new('Title', 'Author', 'This is content')
Document.explain

class Document
  class << self
    def find_by_name(name)
      puts "by name"
    end

    def find_by_id(doc_id)
      puts "by id"
    end

  end
end

Document.find_by_id(2)
