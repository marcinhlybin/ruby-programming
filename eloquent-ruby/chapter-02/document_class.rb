class Document
  attr_accessor :title, :author, :content
  attr_writer :writable

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def title=(new_title)
    if @writable
      @title = new_title
    end
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

doc = Document.new('Hamlet', 'Shakespeare', 'To be or not to be')
doc.writable=true
doc.title='Hello'
puts doc.title
