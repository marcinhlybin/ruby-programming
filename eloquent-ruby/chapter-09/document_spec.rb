require './document.rb'

RSpec.describe Document do
  before :each do
    @text = 'A bunch of words'
    @doc = Document.new('test', 'nobody', @text)
  end

  it 'should hold on to the contents' do
    expect(@doc.content).to eq @text
  end

  it 'should return all of the words in the document' do
    expect(@doc.words).to include 'A'
    expect(@doc.words).to include 'bunch'
    expect(@doc.words).to include 'of'
    expect(@doc.words).to include 'words'
  end

  it 'should know how many words it contains' do
    expect(@doc.word_count).to eq 4
  end

  after :all do
    puts "All tests ended"
  end
end

RSpec.describe PrintableDocument do
  before :each do
    @text = 'A bunch of words'
    @doc = PrintableDocument.new('test', 'nobody', @text)
  end

  
  it 'should know how to print itself' do
    mock_printer = mock('Printer')
    mock_printer.should_receive(:available?).and_return(true)
    mock_printer.should_receive(:render).exactly(3).times
    expect(@doc.print(mock_printer)).to eq 'Done'
  end

  # it 'should return the proper string if printer is offline' do
  #   stub_printer = stub :available? => false, :render => nil
  #   expect(@doc.print(stub_printer)).to eq 'Printer unavailable'
  # end
end

