#!/usr/bin/env ruby

# part 1
data = File.open('./input.txt', 'r') { |f| f.read }
puts data.count('(') - data.count(')')

# part 2
floor = 0
data.each_char.with_index do |c, index|
  case c
  when '('
    floor = floor + 1
  when ')'
    floor = floor - 1
  end
  if floor == -1
    puts index+1
    break
  end
end
