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
		 computer = Computer.new(1)
     computer.load([1002,4,3,4,33])
     computer.run
     assert_equal [1002,4,3,4,99], computer.finish
   end

	 def test_get_code
		 computer = Computer.new(1)
		 assert_equal 2, computer.get_code(1002)
		 assert_equal 3, computer.get_code(3)
		 assert_equal 1, computer.get_code(10101)
		 assert_equal 99, computer.get_code(10099)
	 end

	 def test_get_mode
		computer = Computer.new(1)
		assert_equal 0, computer.get_mode(3,1)
		assert_equal 1, computer.get_mode(1101, 1)
		assert_equal 1, computer.get_mode(1101, 2)
	 end

	 def test_negative_values
		 computer = Computer.new(1)
		 computer.load([1101,100,-1,4,0])
		 computer.run
		 assert_equal [1101,100,-1,4,99], computer.finish
	 end

	 def test_part_one
		 computer = Computer.new(1)
		 file = File.open('input.txt')
		 input = file.read
		 input = input.split(",")
		 input = input.map(&:to_i)
		 computer.load(input)
		 computer.run
		 assert_equal 11933517, computer.diagnostic
	end

	def test_opcode_with_8
		computer = Computer.new(8)
		computer.load([3,9,8,9,10,9,4,9,99,-1,8])
		computer.run
		assert_equal 1, computer.diagnostic
	end

	def test_opcode_less_8
		computer = Computer.new(8)
		computer.load([3,9,7,9,10,9,4,9,99,-1,8])
		computer.run
		assert_equal 0, computer.diagnostic
	end

	def test_opcode_immediate
		computer = Computer.new(8)
		computer.load([3,3,1108,-1,8,3,4,3,99])
		computer.run
		assert_equal 1, computer.diagnostic
	end

	def test_jump_zero
		computer = Computer.new(0)
		computer.load([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
		computer.run
		assert_equal 0, computer.diagnostic
	end

	def test_jump_nonzero
		computer = Computer.new(10)
		computer.load([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
		computer.run
		assert_equal 1, computer.diagnostic
	end

	def test_part_two
		 computer = Computer.new(5)
		 file = File.open('input.txt')
		 input = file.read
		 input = input.split(",")
		 input = input.map(&:to_i)
		 computer.load(input)
		 computer.run
		 assert_equal 0, computer.diagnostic
	end
 end
