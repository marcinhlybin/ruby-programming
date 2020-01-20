module WritingQuality

  CLICHES = [ /play fast and loose/,
              /make no mistake/,
              /does the trick/,
              /off and running/,
              /my way or the highway/ ]


  def number_of_cliches
    CLICHES.inject(0) do |count, phrase|
      count += 1 if phrase =~ content
      count 
    end
  end
end

class Document
  include WritingQuality

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

text = "my way or the highway does the trick"
doc = Document.new('Hackneyed', 'Russ', text)
puts doc.number_of_cliches
