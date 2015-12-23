#!/usr/bin/env ruby

input = File.readlines('input.txt')

count1 = 0
count2 = 0
input.each do |line|
  line.chomp!
  if (
    line.match(/[aeiou].*?[aeiou].*?[aeiou]/) &&
    line.match(/([[:alpha:]])\1/) &&
    ! line.match(/(?:ab|cd|pq|xy)/)
  )
    count1 += 1
  end
  if (
    line.match(/([[:alpha:]][[:alpha:]]).*?\1/) &&
    line.match(/([[:alpha:]]).\1/)
  )
    count2 += 1
  end
end
puts count1
puts count2
