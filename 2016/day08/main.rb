require_relative 'day08.rb'

screen = Screen.new(7,3)
screen.rect(3,2)
puts screen.rotate_col(1,2)

puts screen.to_s

