require_relative 'day_10'
require 'set'

input = File.readlines('input.txt', chomp: true).map(&:chars)

ast = Asteroids.new(input)
puts "Part One: " + ast.line_of_sight.to_s

