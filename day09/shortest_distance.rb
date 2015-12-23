#!/usr/bin/env ruby

require 'pp'

@distances = Hash.new{|h, k| h[k] = Hash.new()}

input = File.readlines('input.txt')

input.each do |line|
  start, finish, distance = line.match(/^([[:alpha:]]+) to ([[:alpha:]]+) = ([[:digit:]]+)$/).captures
  @distances[start][finish] = distance.to_i
  @distances[finish][start] = distance.to_i
end

@shortest_route, @longest_route = (), ()
@shortest_total, @longest_total = nil, nil

@distances.keys.permutation do |p|

  total = 0
  complete = false

  p.each_with_index do |e, i|
    complete = true and break if i+1 == p.length
    break unless @distances[e].has_key?(p[i+1])
    total += @distances[e][p[i+1]]
  end

  next unless complete

  if  @shortest_total.nil? || total < @shortest_total
    @shortest_total, @shortest_route = total, p.clone
  end
  if @longest_total.nil? || total > @longest_total
    @longest_total, @longest_route = total, p.clone
  end
end

puts @shortest_route.join(' -> ') + " + " + @shortest_total.to_s
puts @longest_route.join(' -> ') + " + " + @longest_total.to_s
