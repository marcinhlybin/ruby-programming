class CompositeBase
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.member_of(composite_name)
    code = %Q{
      attr_accessor :parent_#{composite_name}
    }
    class_eval(code)
  end

  def self.composite_of(composite_name)
    member_of composite_name
    code = %Q{
      def sub_#{composite_name}s
        @sub_#{composite_name}s = [] unless @sub_#{composite_name}s
        @sub_#{composite_name}s
      end
      def add_sub_#{composite_name}(child)
        return if sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s << child
        child.parent_#{composite_name} = self
      end
      def delete_sub_#{composite_name}(child)
        return unless sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s.delete(child)
        child.parent_#{composite_name} = nil
      end 
    }
    class_eval(code)
  end
end

class Tiger < CompositeBase
  member_of(:population)
  member_of(:classification)
  # Lots of code omitted . . .
end

class Tree < CompositeBase
  member_of(:population)
  member_of(:classification)
  # Lots of code omitted . . .
end

class Jungle < CompositeBase
  composite_of(:population)
  # Lots of code omitted . . .
end

class Species < CompositeBase
  composite_of(:classification)
  # Lots of code omitted . . .
end

tony_tiger = Tiger.new("tony")
se_jungle = Jungle.new("southeastern jungle tigers")
se_jungle.add_sub_population(tony_tiger)

tony_tiger.parent_population
species = Species.new("P. tigris")
species.add_sub_classification(tony_tiger)
tony_tiger.parent_classification  # Should be P. tigris
