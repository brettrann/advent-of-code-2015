#!/usr/bin/env ruby

input = File.readlines('input.txt')

count_encoded = 0
count_decoded = 0
count_double_encoded = 0

input.each do |line|
  line.chomp!
  count_encoded += line.length
  count_decoded += eval(line).length
  count_double_encoded += line.dump.length
end

puts count_encoded - count_decoded
puts count_double_encoded - count_encoded
