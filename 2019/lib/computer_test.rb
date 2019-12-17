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

   def test_comp_1
     c = Computer.new
     c.load([2,3,0,3,99])
     assert_equal [2,3,0,6,99], c.run
   end

   def test_comp_2
     c = Computer.new
     c.load([2,4,4,5,99,0])
     assert_equal [2,4,4,5,99,9801], c.run
   end
 
   def test_comp_3
     c = Computer.new
     c.load([1,1,1,4,99,5,6,0,99])
     assert_equal [30,1,1,4,2,5,6,0,99], c.run
   end
   
   def test_comp_4
     c = Computer.new
     c.set_in(1)
     c.load([1002,4,3,4,33])
     assert_equal [1002,4,3,4,99], c.run
   end

   def test_negative_values
     c = Computer.new
     c.set_in(1)
     c.load([1101,100,-1,4,0])
     assert_equal [1101,100,-1,4,99], c.run
   end

  def test_opcode_with_8
    c = Computer.new
    c.set_in(8)
    c.load([3,9,8,9,10,9,4,9,99,-1,8])
    c.run
    assert_equal 1, c.get_out
  end

  def test_opcode_less_8
    c = Computer.new
    c.set_in(8)
    c.load([3,9,7,9,10,9,4,9,99,-1,8])
    c.run
    assert_equal 0, c.get_out
  end

  def test_opcode_immediate
    c = Computer.new
    c.set_in(8)
    c.load([3,3,1108,-1,8,3,4,3,99])
    c.run
    assert_equal 1, c.get_out
  end

  def test_jump_zero
    c = Computer.new
    c.set_in(0)
    c.load([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
    c.run
    assert_equal 0, c.get_out
  end

  def test_jump_nonzero
    c = Computer.new
    c.set_in(10)
    c.load([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
    c.run
    assert_equal 1, c.get_out
  end

   def test_amp_phase_1
     phase_sequence = [4,3,2,1,0]
     signal = 0

    phase_sequence.each do |p|
      amp = Computer.new
      amp.set_in(p)
      amp.set_in(signal)
      amp.load([3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0])
      amp.run
      signal = amp.get_out
    end
    assert_equal 43210, signal
   end

   def test_amp_phase_2
     phase_sequence = [0,1,2,3,4]
     signal = 0

    phase_sequence.each do |p|
      amp = Computer.new
      amp.set_in(p)
      amp.set_in(signal)
      amp.load([3,23,3,24,1002,24,10,24,1002,23,-1,23,
101,5,23,23,1,24,23,23,4,23,99,0,0])
      amp.run
      signal = amp.get_out
    end
    assert_equal 54321, signal
   end
  end
