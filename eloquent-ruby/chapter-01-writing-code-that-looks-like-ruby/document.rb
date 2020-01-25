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
end

doc = Document.new('Hamlet', 'Shakespeare', 'To be or not to be')
puts "Title #{doc.title}"
puts "Author #{doc.author}"
puts "Content #{doc.content}"
puts "Words: #{doc.words}"
puts "Word count #{doc.word_count}"
