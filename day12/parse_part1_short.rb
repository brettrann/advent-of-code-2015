#!/usr/bin/env ruby

require 'json'
require 'pp'


def parse(data)
  data.is_a?(Array) ? data.reduce(0) {|m, e| m += parse(e)} :
  data.is_a?(Hash)  ? data.values.reduce(0) {|m, e| m += parse(e)} :
                      data.to_i
end

input = JSON.parse(File.open('input.json').read)

puts parse(input)
