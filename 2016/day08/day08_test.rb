  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day08.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class SolverTest < Minitest::Test
   def setup
     @screen = Screen.new(7,3)
   end

   def test_rect_3_2
     skip
     @screen.rect(3,2)
     s = <<~HEREDOC
         ###....
         ###....
         .......
         HEREDOC
     assert_equal s, @screen.to_s
   end

   def test_rect_1_1
     skip
     @screen.rect(1,1)
     s = <<~HEREDOC
         #......
         .......
         .......
         HEREDOC
     assert_equal s, @screen.to_s
   end

   def test_rotate_col
     @screen.rect(3,2)
     @screen.rotate_col(1,2)
     s = <<~HEREDOC
         #.#....
         ###....
         .#.....
         HEREDOC
     #assert_equal s, @screen.to_s
     puts @screen.to_s
   end
 
   def test_rotate_col_with_steps
     skip
     @screen.rect(3,2)
     @screen.rotate_col(1,2)
     s = <<~HEREDOC
        ###....
        #.#....
        .#.....
        HEREDOC
     # assert_equal s, @screen.to_s
     # puts @screen.to_s
   end

   def test_rotate_row
   end
 end
