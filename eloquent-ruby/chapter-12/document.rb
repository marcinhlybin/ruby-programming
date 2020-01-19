class DocumentIdentifier
  attr_reader :folder, :name

  def initialize(folder, name)
    @folder = folder
    @name = name
  end

  def ==(other)
    return true if other.equal?(self)
    return false unless other.kind_of?(self.class)
    folder == other.folder && name == other.name
  end
end

class ContractIdentifier < DocumentIdentifier
end

class DocumentPointer
  attr_reader :folder, :name

  def initialize(folder, name)
    @folder = folder
    @name = name
  end

  def ==(other)
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    folder == other.folder && name == other.name
  end
end

first_id = DocumentIdentifier.new('secret/plans', 'raygun.txt')
second_id = ContractIdentifier.new('secret/plans', 'raygun.txt')

puts "Document is equal Contract" if first_id == second_id

doc_id = DocumentIdentifier.new('secret/area51', 'phone list')
pointer = DocumentPointer.new('secret/area51', 'phone list')

puts "Document is equal Pointer" if pointer == doc_id

