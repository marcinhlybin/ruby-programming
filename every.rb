# This is an excerpt from whenever module
# Shows how to add custom method .hours to Numeric class.

class NumericSeconds
  attr_reader :number

  def self.seconds(number, units)
    new(number).send(units)
  end

  def initialize(number)
    @number = number.to_i
  end

  def hours
    number * 3_600
  end
end

Numeric.class_eval do
  def respond_to?(method, include_private = false)
    super || NumericSeconds.public_method_defined?(method)
  end

  def method_missing(method, *args, &block)
    if NumericSeconds.public_method_defined?(method)
      NumericSeconds.new(self).send(method)
    else
      super
    end
  end
end

def every(frequency, options={})
  puts "frequency: #{frequency}, options: #{options}"
end

every 1.hours at: '08:00', roles: [:rake_runner]
every 1.hours, at: '08:00', roles: [:rake_runner]
