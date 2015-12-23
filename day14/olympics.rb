#!/usr/bin/env ruby

require 'pp'

input = File.readlines('input.txt')

entrants = []

input.each do |line|
  reindeer, speed, duration, rest = line.match(/^(\w+).*?(\d+).*?(\d+).*?(\d+)/).captures
  distance = time_moving = time_resting = score = 0
  entrants << [reindeer, speed.to_i, duration.to_i, rest.to_i,
               distance, time_moving, time_resting, score, true]
end

(1..2503).each do |s|
  entrants.each do |e|
    if e[-1]
      e[4] += e[1]
      e[5] += 1
      e[-1] = false if e[5] % e[2] == 0
    else
      e[6] += 1
      e[-1] = true if e[6] % e[3] == 0
    end
  end
  max = entrants.map {|e| e[4]}.max
  entrants.select {|e| e[4] == max}.map {|e| e[7] += 1}
end

# part1
pp entrants.map {|e| e[4]}.max
#part2
pp entrants.map {|e| e[7]}.max
