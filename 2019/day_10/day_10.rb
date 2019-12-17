#!/usr/bin/env ruby

 class Asteroids
   attr_accessor :asteroids

   def initialize(input)
     @asteroids = Array.new

     input.map.with_index do |r,i|
       r.map.with_index do |c,j|
         p = Point.new(j,i)
         @asteroids << p if c == "#"
       end
     end
   end

   def line_of_sight
     hist = Hash.new(0)

     @asteroids.each do |a|
       slopes = Set.new
       @asteroids.each do |o|
         if o != a
           slopes << Math.atan2(o.y - a.y, o.x - a.x)
         end
       end
       hist[a] = slopes.length
     end

     max = 0

     hist.each do |k,v|
       max = v if v > max	
     end
     max
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
