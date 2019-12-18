#!/usr/bin/env ruby

 class Asteroids
    attr_accessor :asteroids, :station

   def initialize(input)
     @asteroids = Array.new

     input.map.with_index do |r,i|
       r.map.with_index do |c,j|
         p = Asteroid.new(j,i)
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
       if v > max	
         max = v
         @station = k
       end
     end
     max
   end

   def targets
     targets = @asteroids.map do |a|
       l = LaserTargets.new(@station)
       l.asteroid=(a)
       l
     end
     targets
   end
   
 end

 class LaserTargets
   include Comparable
   attr_accessor :a
   alias_method :asteroid=, :a=

   def initialize(station)
     @station = station
   end

   def<=>(o)
     return nil unless o.a.is_a? Asteroid
     return 0 if self.a == o.a
     this = Math.atan2(@station.y - self.a.y, @station.x - self.a.x)
     that = Math.atan2(@station.y - o.a.y, @station.x - o.a.x)
     return -1 if this < that
     return 1 if this > that
     return 0
   end

 end


 class Asteroid
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
