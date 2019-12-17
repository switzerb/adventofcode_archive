require_relative 'day_10'

# puts Math.atan2(3,2)

def cartesian(magnitude, angle)
  [magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
end

def polar(x,y)
  return Math.hypot(y,x), Math.atan2(y,x)
end

#puts cartesian(3.61, Math.atan2(3,2))

#puts "polar #{polar(3,4)}"
#puts "polar #{polar(2,2)}"
#puts "polar #{polar(1,0)}"

puts Math.atan2(-2,-1)
puts Math.atan2(-4,-2)

first = ".#..#.....#####....#...##"

grid = Grid.new(5)
grid.draw(first)
pp grid.to_s
