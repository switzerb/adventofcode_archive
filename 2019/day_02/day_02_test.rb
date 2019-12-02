  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_02.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class SolverTest < Minitest::Test
   def setup
     input = [1,9,10,3,2,3,11,0,99,30,40,50]
     @program = Intcode.new(input)
   end

   def test_program_1
     program = Intcode.new([1,0,0,0,99])
     program.run
     assert_equal [2,0,0,0,99], program.finish
   end

   def test_program_2
     program = Intcode.new([2,3,0,3,99])
     program.run
     assert_equal [2,3,0,6,99], program.finish
   end
 
   def test_program_3
     program = Intcode.new([2,4,4,5,99,0])
     program.run
     assert_equal [2,4,4,5,99,9801], program.finish
   end
 
   def test_program_4
     program = Intcode.new([1,1,1,4,99,5,6,0,99])
     program.run
     assert_equal [30,1,1,4,2,5,6,0,99], program.finish
   end

   def test_program_5
    file = File.open("input.txt")
    input = file.read
    input = input.split(",")
    input = input.map(&:to_i)

    input[1] = 12
    input[2] = 2

    program = Intcode.new(input)
    program.run

    assert_equal 3790645, program.part_one
   end

   def test_program_6
    file = File.open("input.txt")
    input = file.read
    input = input.split(",")
    input = input.map(&:to_i)

    program = Intcode.new(input)

    assert_equal 1202, program.part_two(3790645)
   end

end
