require "./xml_ripper.rb"
require "treetop"
require "./ez_ripper_statement.rb"

class EzRipper
  def initialize(program_path)
    @ripper = XmlRipper.new
    parse_program(program_path)
  end

  def run(xml_file)
    @ripper.run(xml_file)
  end

  def parse_program(program_path)
    File.open(program_path) do |f|
      until f.eof?
        parse_statement(f.readline)
      end
    end
  end

  def parse_statement(statement)
    statement = statement.sub(/#.*/, "")
    tokens = statement.strip.split
    return if tokens.empty?

    case tokens.first
    when "print"
      raise "Expected print <xpath>" unless tokens.size == 2
      @ripper.on_path(token[1]) do |el|
        puts el.text
      end
    when "delete"
      raise "Expectd delete <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]) { |el| el.remove }
    when "replace"
      unless tokens.size == 3
        raise "Expected replace <xpath> <value>"
      end
      @ripper.on_path(tokens[1]) { |el| el.text = tokens[2] }
    when "print_document"
      raise "Expected print_document" unless tokens.size == 1
      @ripper.after do |doc|
        puts doc
      end
    when "uppercase"
      raise "Expected uppercase <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]) { |el| el.text = el.text.upcase }
    else
      raise "Unknown keyword #{tokens.first}"
    end
  end
end

# EzRipper.new("edit.ezr").run("fellowship.xml")

statement = "replace '/document/author' 'Russ Olsen'"
parser = EzRipperStatementParser.new
parse_tree = parser.parse(statement)
