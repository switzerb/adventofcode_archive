require_relative 'day_08'

file = File.open(__dir__ + "/input.txt")
input = file.read
input = input.chars
data = input.map(&:to_i)

# puts input

sif = SIF.new(data, 25, 6)
puts sif.part_one
puts sif.part_two



