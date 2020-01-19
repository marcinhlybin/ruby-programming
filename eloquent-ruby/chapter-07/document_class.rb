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

  private def word_count
    words.size
  end  

end


class RomanceNovel < Document
  def number_of_steamy_words
    word_count / 4
  end
end

doc = RomanceNovel.new('Hamlet', 'Shakespeare', 'To be or not to be')
doc.words_size
