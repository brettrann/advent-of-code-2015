#!/usr/bin/env ruby

require 'pp'
array = File.readlines('input.txt').map(&:to_i)

f=->(l,g,i=1){l.combination(i).select{|a|a.reduce(:+)==(l.reduce(:+)/g)}.map{|a|a.reduce(:*)}.min||f.(l,g,i+1)}

p f.(array, 3)
p f.(array, 4)
