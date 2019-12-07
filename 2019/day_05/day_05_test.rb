#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative '../lib/computer'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class SolverTest < Minitest::Test
   def setup
     @computer = Computer.new
   end

   def test_opcode_3
     @computer.load([1002,4,3,4,33])
     @computer.run
     assert_equal [1002,4,3,4,99], @computer.finish
   end
 end
