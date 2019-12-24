#!/usr/bin/env ruby
require 'matrix'
require 'pry'

 class System
   attr_accessor :moons

   def initialize(moons)
     @moons = moons.dup
   end

   def step
     @moons.permutation(2).to_a.map do |pair|
       moon1 = pair[0]
       moon2 = pair[1]
       moon1.apply_gravity(moon2)
       moon2.apply_gravity(moon1)
     end
   end

 end

 class Moon
  attr_accessor :name, :pos, :vel

  X = 0
  Y = 1
  Z = 3

  def initialize(name, map)
    @name = name
    @pos = Vector.elements(map)
    @vel = Vector.zero(3)
  end

  def apply_gravity(moon)
    delta = moon.pos.zip(@pos).map do |a,b| 
      case
        when a > b then 1
        when a < b then -1
        else 0
      end
    end
    @vel += Vector.elements(delta)
  end

  def apply_velocity
    @pos += @vel
  end

  def potential
    @pos.inject(0) { |sum,p| sum + p.abs }
  end

  def kinetic
    @vel.inject(0) { |sum,v| sum + v.abs }
  end

  def total_energy
    potential * kinetic
  end

  def to_s
    "#{name} pos=<x=#{@pos[X]}, y=#{@pos[Y]}, z=#{@pos[Z]}>, vel=<x=#{@vel[X]}, y=,#{@vel[Y]}, z=#{@vel[Z]}>"
  end
 end
