#!/usr/bin/env ruby

require 'pp'

input = File.readlines('input.txt')

ingredients = Hash.new {|h, k| h[k] = Hash.new}

input.each do |line|
  name, capacity, durability, flavor, texture, calories =
    line.match(/^(\w+):.*?(-?\d+).*?(-?\d+).*?(-?\d+).*?(-?\d+).*?(-?\d+)$/).captures
  ingredients[name.to_sym] = {
    :capacity => capacity.to_i,
    :durability => durability.to_i,
    :flavor => flavor.to_i,
    :texture => texture.to_i,
    :calories =>  calories.to_i
  }
end

highest = 0

ingredients.keys.repeated_combination(100).each do |p|

  capacity, durability, flavor, texture, calories = 0, 0, 0, 0, 0

  p.each do |ingredient|
    capacity   += ingredients[ingredient][:capacity]
    durability += ingredients[ingredient][:durability]
    flavor     += ingredients[ingredient][:flavor]
    texture    += ingredients[ingredient][:texture]
    calories   += ingredients[ingredient][:calories]
  end

  # part2
  next unless calories == 500

  score =
    ( capacity   < 0 ? 0 : capacity   ) *
    ( durability < 0 ? 0 : durability ) *
    ( flavor     < 0 ? 0 : flavor     ) *
    ( texture    < 0 ? 0 : texture    )

  highest = score if score > highest
end

puts "part1: #{highest}"
