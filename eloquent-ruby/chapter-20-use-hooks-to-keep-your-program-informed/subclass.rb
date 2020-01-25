class BaseClass
  def self.inherited(subclass)
    puts "Hey #{subclass} is now a subclass of #{self}"
  end
end

class ChildClass < BaseClass
end
