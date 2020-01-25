class Class1
  @@class_variable = :c1

  def initialize
    puts "Class 1: #{@@class_variable}"
  end
end

class Class2 < Class1
  @@class_variable = :c2

  def initialize
    puts "Class 2: #{@@class_variable}"
  end
end

Class1.new # Class 1: c2
Class2.new # Class 1: c2
