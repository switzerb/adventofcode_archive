#!/usr/bin/env ruby

require_relative 'day_02'

file = File.open("input.txt")
input = file.read
input = input.split(",")
input = input.map(&:to_i)

input[1] = 12
input[2] = 2

program = Intcode.new(input)
program.run
puts "part one: " + program.part_one.to_s

file = File.open("input.txt")
inp = file.read
inp = inp.split(",")
inp = inp.map(&:to_i)

pm = Intcode.new(inp)
puts pm.part_two(19690720)
