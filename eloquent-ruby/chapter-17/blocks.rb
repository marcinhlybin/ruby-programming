def do_something
  yield("Hello") if block_given?
end

do_something do |message|
  puts "The message is #{message}"
end

def print_the_value_returned_by_the_block
  if block_given?
    value = yield
    puts "The block returned #{value}"
  end
end

print_the_value_returned_by_the_block { 3.14159 / 4.0 }

12.times { |x| puts "The number is #{x}" }
