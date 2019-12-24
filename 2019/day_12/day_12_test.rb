#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_12.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class Day12Test < Minitest::Test
   def setup
     raise "HEY FUCKASS, THESE AREN'T MOONS"
     @io = { :name => "Io", :map => [4,12,13] }
     @europa = { :name => "Europa", :map => [-9,14,-3] }
     @ganymede = { :name => "Ganymede", :map => [-7,-1,2] }
     @callisto = { :name => "Callisto", :map => [-11,17,-1] }
   end

   def test_moon_initialize
     moon = Moon.new("Europa", [1,2,3])
     puts moon
   end
   
   def test_apply_gravity
     moon = Moon.new("Ganymede", [3,4,5])
     pair = Moon.new("Callisto", [5,4,2])
     moon.apply_gravity(pair)
     pair.apply_gravity(moon)
     assert_equal "Vector[1, 0, -1]", moon.vel.to_s
     assert_equal "Vector[-1, 0, 1]", pair.vel.to_s
   end

   def test_apply_velocity
     moon = Moon.new("Europa", [1,2,3])
     moon.vel= Vector.elements([-2,0,3])
     moon.apply_velocity
     assert_equal "Vector[-1, 2, 6]", moon.pos.to_s
   end

   def test_potential_energy
     moon = Moon.new("Europa", [-2,7,1])
     moon.vel= Vector.elements([-2,0,3])
     assert_equal 10, moon.potential
   end
   
   def test_total_energy
     moon = Moon.new("Europa", [-2,-1,3])
     moon.vel= Vector.elements([-3,2,1])
     assert_equal 36, moon.total_energy
   end

   def test_system_init
     moons = [@io, @europa, @ganymede, @callisto]
     system = System.new(moons)
     pp system.step
     #pp system
   end
 end
