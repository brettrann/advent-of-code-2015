#!/usr/bin/env ruby

input = '1113122113'

50.times { input = input.gsub(/(.)\1*/) {|sub| "#{sub.length}#{sub[0]}"} }
puts input.length
