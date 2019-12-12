  begin
    require 'minitest'
    require 'minitest/autorun'
    require_relative 'computer'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

	class ComputerTest < Minitest::Test

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

   def test_opcode_add
     program = Computer.new
     program.load([1,0,0,0,99])
     program.run
     assert_equal [2,0,0,0,99], program.finish
   end
	 
	 def test_amp_phase_1
		phase_sequence = [4,3,2,1,0]

		input = 0

		phase_sequence.each do |p|
			amplifier = Computer.new(input,p)
			amplifier.load([3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0])
			amplifier.run
			input = amplifier.diagnostic
		end
		assert_equal 43210, input
	 end

	 def test_amp_phase_2
		phase_sequence = [0,1,2,3,4]

		input = 0

		phase_sequence.each do |p|
			amplifier = Computer.new(input,p)
			amplifier.load([3,23,3,24,1002,24,10,24,1002,23,-1,23,
101,5,23,23,1,24,23,23,4,23,99,0,0])
			amplifier.run
			input = amplifier.diagnostic
		end
		assert_equal 54321, input
	 end
	end
