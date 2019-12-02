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

program.part_two
