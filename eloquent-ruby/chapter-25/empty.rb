class MostlyEmpty
  puts "Hello from inside the class #{self}"
  puts __FILE__
end

class LessEmpty
  pp instance_methods(false)

  def do_something
    puts "I'm doing something!"
  end

  pp instance_methods(false)
end
