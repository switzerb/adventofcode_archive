#!/usr/bin/env ruby
  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_03.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class SolverTest < Minitest::Test
   def setup
     @fueler = Fueler.new
   end

   def test_paths
     @fueler.draw_paths(["R8","U5","L5","D3"], "A")
     @fueler.draw_paths(["U7","R6","D4","L4"], "B")
     puts @fueler.intersections.to_s
     puts @fueler.manhattan_distance
   end

   def test_min_dist_1
     @fueler.draw_paths(["R75","D30","R83","U83","L12","D49","R71","U7","L72"], "A")
     @fueler.draw_paths(["U62","R66","U55","R34","D71","R55","D58","R83"], "B")
     puts @fueler.intersections.to_s
     assert_equal 610, @fueler.min_distance
   end
 end
