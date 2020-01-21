class Paragraph
  attr_accessor :font_name, :font_size, :font_emphasis
  attr_accessor :text

  def initialize(font_name, font_size, font_emphasis, text = "")
    @font_name = font_name
    @font_size = font_size
    @font_emphasis = font_emphasis
    @text = text
  end

  def to_s
    @text
  end
end

class StructuredDocument
  attr_accessor :title, :author, :paragraphs

  def self.paragraph_type(paragraph_name, options)
    name = options[:font_name] || :arial
    size = options[:font_size] || 12
    emphasis = options[:font_emphasis] || :normal

    define_method(paragraph_name) do |text|
      paragraph = Paragraph.new(name, size, emphasis, text)
      self << paragraph
    end
    #   code = %Q{
    #     def #{paragraph_name}(text)
    #       p = Paragraph.new(:#{name}, #{size}, :#{emphasis}, text)
    #       self << p
    #     end
    #   }
    #   class_eval(code)
  end

  def initialize(title, author)
    @title = title
    @author = author
    @paragraphs = []
    yield(self) if block_given?
  end

  def <<(paragraph)
    @paragraphs << paragraph
  end

  def content
    @paragraphs.inject("") { |text, para| "#{text}\n#{para}" }
  end
end

class Resume < StructuredDocument
end

class Instructions < StructuredDocument
  paragraph_type(:introduction,
                 :font_name => :arial,
                 :font_size => 18,
                 :font_emphasis => :italic)
end

russ_cv = StructuredDocument.new("Resume", "RO") do |cv|
  cv << Paragraph.new(:nimbus, 14, :bold, "Russ Olsen")
  cv << Paragraph.new(:nimbus, 12, :italic, "1313 Mocking Bird Lane")
  cv << Paragraph.new(:nimbus, 12, :none, "russ@russolsen.com")
end

pp russ_cv.content
