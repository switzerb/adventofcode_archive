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
   def test_opcode_3
		 skip
		 computer = Computer.new
     computer.load([1002,4,3,4,33])
     computer.run
     assert_equal [1002,4,3,4,99], computer.finish
   end

	 def test_get_code
		 skip
		 computer = Computer.new
		 assert_equal 2, computer.get_code(1002)
		 assert_equal 3, computer.get_code(3)
		 assert_equal 1, computer.get_code(10101)
		 assert_equal 99, computer.get_code(10099)
	 end

	 def test_get_mode
		skip
		 computer = Computer.new
		assert_equal 0, computer.get_mode(3,1)
		assert_equal 1, computer.get_mode(1101, 1)
		assert_equal 1, computer.get_mode(1101, 2)
	 end

	 def test_negative_values
		 skip
		 computer = Computer.new
		 computer.load([1101,100,-1,4,0])
		 computer.run
		 assert_equal [1101,100,-1,4,99], computer.finish
	 end

	 def test_part_one
		 computer = Computer.new
		 file = File.open('input.txt')
		 input = file.read
		 input = input.split(",")
		 input = input.map(&:to_i)
		 computer.load(input)
		 computer.run
		 assert_equal [], computer.finish
	end

 end
