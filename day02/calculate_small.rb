#!/usr/bin/env ruby

input = File.readlines("input.txt")

paper = 0
ribbon = 0

input.each do |line|
  h,w,l = line.strip.split('x').map {|e| e.to_i}.sort
  paper = paper + 2*h*w + 2*w*l + 2*h*l + h*w
  ribbon = ribbon + 2*h + 2*w + h*w*l
end

puts "paper: #{paper}"
puts "ribbon: #{ribbon}"
