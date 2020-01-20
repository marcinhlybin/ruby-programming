def run_that_block(&that_block)
  puts "About to run the block"
  that_block.call if that_block
  puts "Done running the block"
end

# run_that_block do
#   puts "Inside the block"
# end

run_that_block
