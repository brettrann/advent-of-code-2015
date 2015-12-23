#!/usr/bin/env ruby

input = File.readlines('input.txt')

lights1 = Array.new(1000) { Array.new(1000, 0) }
lights2 = Array.new(1000) { Array.new(1000, 0) }

input.each do |line|

  cmd, x1, y1, x2, y2 = line.match(/^(turn on|toggle|turn off) (\d+),(\d+) through (\d+),(\d+)$/).captures

  action1 = nil
  action2 = nil
  case cmd
  when /turn on/
    action1 = Proc.new {1}
    action2 = Proc.new {|value| value+1}
  when /turn off/
    action1= Proc.new {0}
    action2= Proc.new {|value| value > 0 ? value-1 : 0}
  when /toggle/
    action1 = Proc.new {|value| value == 1 ? 0 : 1}
    action2 = Proc.new {|value| value +2}
  else
    puts "#{cmd} unexpected"
    exit 1
  end
  for x in x1.to_i .. x2.to_i
    for y in y1.to_i .. y2.to_i
      lights1[x][y] = action1.call(lights1[x][y])
      lights2[x][y] = action2.call(lights2[x][y])
    end
  end
end

def count(lights)
  count = 0
  lights.each do |row|
    row.each do |light|
      count += light
    end
  end
  count
end

puts count(lights1)
puts count(lights2)
