#!/usr/bin/env ruby

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x, @y = x, y
  end
end

input = File.readlines('input.txt')

input.each do |line|
  houses = Hash.new(0)
  points = [Point.new(0,0), Point.new(0,0)]
  houses[[0,0]] = 2
  line.chomp.each_char.with_index do |c, i|
    p = points[i%2]
    case c
    when '<'; p.x -= 1
    when '^'; p.y += 1
    when '>'; p.x += 1
    when 'v'; p.y -= 1
    else ; exit 1
    end
    houses[[p.x, p.y]] += 1
  end
  puts houses.size
end
