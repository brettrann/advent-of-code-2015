#!/usr/bin/env ruby

require 'pp'

input = File.readlines('input.txt').map(&:to_i)

puts (1..input.size).reduce(0) {|sum, i| sum + input.combination(i).count {|c| c.reduce(:+) == 150 }}
puts input.sort.combination(4).count {|c| c.reduce(:+) == 150}
