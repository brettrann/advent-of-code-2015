#!/usr/bin/env ruby

input = File.readlines('input.txt')

sues = Hash.new {|h, k| h[k] = Hash.new}

input.each do |line|
  name, a, ac, b, bc, c, cc =
    line.match(/^Sue (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)$/).captures
  sues[name.to_sym] = {
    a.to_sym => ac.to_i,
    b.to_sym => bc.to_i,
    c.to_sym => cc.to_i
  }
end

clues = {
  :children    => lambda {|i| i==3},
  :cats        => lambda {|i| i>=7},
  :samoyeds    => lambda {|i| i==2},
  :pomeranians => lambda {|i| i<3},
  :akitas      => lambda {|i| i==0},
  :vizslas     => lambda {|i| i==0},
  :goldfish    => lambda {|i| i<5},
  :trees       => lambda {|i| i>=3},
  :cars        => lambda {|i| i==2},
  :perfumes    => lambda {|i| i==1}
}

sues.keys.each do |sue|
  found = true
  clues.keys.each do |clue|
    next unless sues[sue].has_key? clue
    next if clues[clue].call(sues[sue][clue])
    found = false
  end
  if found
    puts sue.to_s
    exit 0
  end
end
