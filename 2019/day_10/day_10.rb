#!/usr/bin/env ruby

 class Asteroids
 end

 class Grid

   def initialize(width)
     @grid = Hash.new
     @width = width
   end

   def draw(input)
     chs = input.chars
     chs.each_with_index do |c,i|
       point = Point.new(i, 0)
       @grid[point] = c
     end
     @grid
   end

   def to_s
     @grid.map do |k,v|
        "#{k}:#{v}"
     end
   end
 end

 class Point
   attr_accessor :x, :y
   alias_method :==, :eql?

   def initialize(x,y)
     @x = x
     @y = y
   end

   def to_s
    "[#{@x}, #{@y}]"
   end

   def hash
     @x + @y
   end

   def eql?(other)
     other.class == self.class && other.state == self.state
   end
   
   def state
     self.instance_variables.map { |variable| self.instance_variable_get variable }
   end

 end
