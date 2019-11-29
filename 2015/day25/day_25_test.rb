begin
  gem 'minitest', '>=5.0.0'
  require 'minitest/autorun'
  require_relative 'day_25.rb'
rescue Gem::LoadError => e
  puts "\nError:\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class CodeManualTest < Minitest::Test

  def setup
    @manual = CodeManual.new 20151125
  end

  def test_get_count_to
    assert_equal 1, @manual.count_to(1,1)
  end

  def test_get_count_to_4_2
    assert_equal 12, @manual.count_to(4,2)
  end

  def test_get_count_to_1_5
    assert_equal 15, @manual.count_to(1,5)
  end

  def test_get_next_code_2
    assert_equal 18749137, @manual.get_next_code(31916031)
  end

  def test_get_solution
    assert_equal 7726640, @manual.get_code(2,4)
  end

  def test_solution_real
    assert_equal 2650453, @manual.get_code(2978, 3083)
  end
end
