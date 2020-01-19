class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def +(other)
    Document.new(title, author, "#{content} #{other.content}")
  end

  def +@
    Document.new(title, author, "I am sure that #{content}")
  end

  def -@
    Document.new(title, author, "I doubt that #{content}")
  end
  
  def !
    Document.new(title, author, "It is not true: #{content}")
  end
end

doc1 = Document.new('Tag Line1', 'Kirk', "These are the voyages")
doc2 = Document.new('Tag Line2', 'Kirk', "of the start ship...")


total_document = doc1 + doc2
puts total_document.content

favorite = Document.new('Favorite', 'Russ', 'Chocolate is best')

unsure = -(+favorite)
puts unsure.content
