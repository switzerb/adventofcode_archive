#!/usr/bin/env ruby
require_relative '../lib/computer'
require_relative '../lib/point'
require 'fiber'
require 'pry'

 class PaintRobot
   attr_accessor :computer, :brain, :hull, :here, :dir, :verbose

   BLACK = 0
   WHITE = 1

  def initialize    
    @computer = Computer.new
    @hull = Hash.new(BLACK) #sparse map
    @here = Point.new(0,0)
    paint(BLACK)
    @dir = :north
    @verbose = false
  end

  def load(program)
    @computer.load(program)
    @brain = Fiber.new { @computer.run }
  end

  def turn_and_step(rotate)
    turn(rotate)
    step(@dir)
  end

  def turn(rotate)
     case
       when @dir == :north && rotate == 0 then face(:west)
       when @dir == :north && rotate == 1 then face(:east)
       when @dir == :south && rotate == 0 then face(:east)
       when @dir == :south && rotate == 1 then face(:west)
       when @dir == :east && rotate == 0 then face(:north)
       when @dir == :east && rotate == 1 then face(:south)
       when @dir == :west && rotate == 0 then face(:south)
       when @dir == :west && rotate == 1 then face(:north)
     end
  end

  def face(dir)
    @dir = dir
  end

  def step(dir)
    @here = @here.step(dir,1)
  end

  def paint(color)
    @hull[@here] = color
  end

  def go
    loop do
      photo
      @brain.resume
      paint(@computer.get_out)
      turn_and_step(@computer.get_out)
      break unless @brain.alive?
    end
  end

  def photo
    @computer.set_in @hull[@here]
  end

  def show_hull
    map = ""
    (-30..30).each do |x|
      (-30..30).each do |y|
        color = @hull[Point.new(x,y)]
        if !@hull.key? Point.new(x,y)
          map += " " 
        elsif color == 0
          map += "."
        elsif color == 1
          map += "#"
        end
      end
      map += "\n"
    end
    map
  end

end

$debug = false
# I guessed 1268
