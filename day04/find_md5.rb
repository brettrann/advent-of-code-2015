#!/usr/bin/env ruby

require 'digest'

key = 'iwrupvqb'
md5 = Digest::MD5.new

num = 0
while(num += 1)
  break if md5.hexdigest("#{key}#{num}").start_with?('000000')
end
puts num
puts md5.hexdigest
