#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
		require_relative '../lib/computer'
		require_relative 'amplifier'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class Day07Test < Minitest::Test
   def setup
		phase_array = [0,1,2,3,4]
		@phase_sequences = phase_array.permutation.to_a

		file = File.open(__dir__ + "/input.txt")
		program = file.read
		program = program.split(",")
		@program = program.map(&:to_i)
   end

   def test_day7_part_one
			max = 0

			@phase_sequences.each do |seq|
				signal = 0
				seq.each do |p|
					amp = Computer.new
					amp.set_in(p)
					amp.set_in(signal)
					amp.load(@program)
					amp.run
					signal = amp.get_out
				end

				if signal > max
					max = signal
				end
			end

     assert_equal 844468, max
   end

	 def test_day7_amp_1
		phases = [9,8,7,6,5]
		amp = Amplifier.new phases
		amp.load([3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5])
		amp.run
		assert_equal 139629729, amp.to_thrusters
	 end
 end
