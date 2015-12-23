#!/usr/bin/env ruby

input = File.readlines('input.txt')

map = Hash.new { |h, k| h[k] = Hash.new }

input.each do |line|
  name, sign, amount, adjacent = line.match(/^(\w+) would (gain|lose) (\d+).* (\w+)\.$/).captures
  map[name][adjacent] = sign == "gain" ? amount.to_i : 0 - amount.to_i
end

# part 2
map.keys.each {|k| map['me'][k] = map[k]['me'] = 0 }

maxhappy = 0

map.keys.permutation do |p|
  temp = 0
  (0...p.length).each do |i|
    p.rotate!(-1)
    temp += map[p[1]][p[0]] + map[p[1]][p[2]]
  end
  maxhappy = temp if temp > maxhappy
end

puts maxhappy
