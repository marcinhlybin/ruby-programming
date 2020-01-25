# Chapter 19: Save blocks to execute later


## block

Block content as parameter:

```
def run_that_block(&that_block)
  puts "About to run the block"
  that_block.call if that_block
  puts "Done running the block"
end

run_that_block do
  puts "Inside the block"
end
```

## lambda

Behaves like a regular object with a single method.

```
DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "Loaded: #{path}"
end
```

## Code from Capistrano

Task:

```
desc "List the home directories"
task :list_home, :role => 'production' do
  run "ls -l /home"
end
```

Implementation:

```
def task(name, options={}, &block)
  name = name.to_sym
  raise ArgumentError, "expected a block" unless block_given?
  # Some code deleted...
  tasks[name] = TaskDefinition.new( name, self,
    {:desc => next_description(:reset)}.merge(options), &block)
  # Some more code deleted...
end
```
