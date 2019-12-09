#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_06.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class SolverTest < Minitest::Test
   def setup
     @day = Solver.new
   end

   def test_orbit
		 orbits = Hash.new
		 orbits["COM"] = ""
		 orbits["B"] = "COM"
		 orbits["C"] = "B"
   end
 end
