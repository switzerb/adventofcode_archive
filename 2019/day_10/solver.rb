require_relative 'day_10'
require 'set'

#input = File.readlines('input.txt', chomp: true).map(&:chars)

     ex2 = <<~INPUT
     .#..#
     .....
     #####
     ....#
     ...##
     INPUT

     input = ex2.split("\n").map(&:chars)

     ast = Asteroids.new(input)
puts "Part One: " + ast.line_of_sight.to_s
puts ast.station

targets = ast.targets
pp targets.sort
