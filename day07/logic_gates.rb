#!/usr/bin/env ruby

# solution adapted from gnuconsulting's @ reddit

require 'pp'

input = File.readlines('input.txt')

# variables mapped/wired to their gates/values
@machine = {}
@output = {}

input.each do |line|
  l, r = line.chomp.split(' -> ')
  @machine[r] = l.split
end

def calc(gate)

  return Integer(gate) rescue

  if ! @output.has_key?(gate)
    operate = @machine[gate]
    if operate.length == 1
      value = calc(operate[0])
    else
      value =
        case operate[-2]
        when /AND/    ; calc(operate[0]) &  calc(operate[2])
        when /OR/     ; calc(operate[0]) |  calc(operate[2])
        when /LSHIFT/ ; calc(operate[0]) << calc(operate[2])
        when /RSHIFT/ ; calc(operate[0]) >> calc(operate[2])
        when /NOT/    ;                  ~  calc(operate[1])
        else          ; puts "unexpected."; exit 1
        end

    end
    @output[gate] = value
  end
  return @output[gate]
end

part1 = calc('a')
@machine['b'] = [part1]
@output = {}
part2 = calc('a')

pp "part1: #{part1}"
pp "part2: #{part2}"
