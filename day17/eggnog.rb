#!/usr/bin/env ruby

require 'pp'

input = File.readlines('input.txt').map(&:to_i).sort.reverse

count     = 0
min_found = false
min       = nil
min_count = 0

(1..input.size).each do |i|
  input.combination(i) do |c|
    if c.reduce(:+) == 150
      count += 1
      unless min_found
        min_found = true
        min       = c.size
      end
      min_count += 1 if min_found && min == c.size
    end
  end
end

puts "part1: #{count}"
puts "part2: minimum containers: #{min_count}"
