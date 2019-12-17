#!/usr/bin/env ruby

 class Asteroids
  
   def play

   end

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
   end

   def eql?
   end

 end
