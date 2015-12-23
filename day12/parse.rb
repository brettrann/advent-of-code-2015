#!/usr/bin/env ruby

require 'json'
require 'pp'


def parse(data)
  if data.is_a? Array
    data.reduce(0) {|m, e| m += parse(e)}
  elsif data.is_a? Hash
    data.has_value?('red') ? 0 : data.values.reduce(0) {|m, e| m += parse(e)}
  else
    data.to_i
  end
end

input = JSON.parse(File.open('input.json').read)

puts parse(input)
