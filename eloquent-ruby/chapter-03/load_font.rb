def load_font(specification_hash)
  puts "name #{specification_hash[:name]}"
  puts "type #{specification_hash[:type]}"
end

load_font :name => 'myfont', :type => 'serif'
