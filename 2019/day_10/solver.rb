require_relative 'day_10'
require 'set'

input = File.readlines('input.txt', chomp: true).map(&:chars)

example = ".#..#\n.....\n#####\n....#\n...##".split("\n").map(&:chars)

asteroids = Array.new

input.map.with_index do |r,i|
	r.map.with_index do |c,j|
		p = Point.new(j,i)
		asteroids << p if c == "#"
	end
end

# pp asteroids

hist = Hash.new(0)

asteroids.each do |a|
	puts "current: " + a.to_s
	slopes = Set.new
	asteroids.each do |o|
		if o != a
			slopes << Math.atan2(o.y - a.y, o.x - a.x)
		end
	end
	hist[a] = slopes.length
	puts ""
end

max = 0

hist.each do |k,v|
	max = v if v > max	
end

puts max
