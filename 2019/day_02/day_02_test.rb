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
    file = File.open("input.txt")
    @input = file.read
    @input = @input.split(",")
    @input = @input.map(&:to_i)
   end

   def test_program_1
     program = Intcode.new
     program.load([1,0,0,0,99])
     program.run
     assert_equal [2,0,0,0,99], program.finish
   end

   def test_program_2
     program = Intcode.new
     program.load([2,3,0,3,99])
     program.run
     assert_equal [2,3,0,6,99], program.finish
   end
 
   def test_program_3
     program = Intcode.new
     program.load([2,4,4,5,99,0])
     program.run
     assert_equal [2,4,4,5,99,9801], program.finish
   end
 
   def test_program_4
     program = Intcode.new
     program.load([1,1,1,4,99,5,6,0,99])
     program.run
     assert_equal [30,1,1,4,2,5,6,0,99], program.finish
   end

   def test_program_5
    program = Intcode.new
    program.load(@input)
    program.run_with(12,2)

    assert_equal 3790645, program.run_with(12,2)
   end

end
