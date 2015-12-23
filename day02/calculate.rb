#!/usr/bin/env ruby


def box(w, h, l)
  2 * side(l, w) + 2 * side(w, h) + 2 * side(h,l)
end

def side(w, h)
  w*h
end

def smallest_side(w, h, l)
  a, b = two_smallest(w, h, l)
  side(a, b)
end

def ribbon(w, h, l)
  a, b = two_smallest(w, h, l)
  a*2 + b*2
end

def bow(w, h, l)
  w * h * l
end

def two_smallest(w, h, l)
  [w, h, l].sort.take(2)
end


wrapping = 0
ribbon = 0
File.open('./input.txt').each_line do |line|
  w, h, l = line.chomp!.split('x').map {|i| i.to_i }
  wrapping_area = box(w, h, l) + smallest_side(w, h, l)
  wrapping = wrapping + wrapping_area
  ribbon = ribbon + ribbon(w, h, l) + bow(w, h, l)
end
puts "part 1: #{wrapping}"
puts "part 2: #{ribbon}"
