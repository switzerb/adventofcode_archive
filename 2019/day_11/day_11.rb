#!/usr/bin/env ruby
require_relative '../lib/computer'

 class PaintRobot
   attr_accessor :robot, :hull, :position, :dir

  def initialize(program)    
    @robot = Computer.new
    @robot.load(program)
    @robot.set_in(0)
    # state of hull grid colors
    # position (0,0)
    # direction (up)
  end

  def go
    @robot.run
    @robot.get_stdout
  end

 end

file = File.open(__dir__ + "/input.txt")
input = file.read
robot = Computer.new
robot.load(input)
fiber = Fiber.new { robot.run }
puts fiber.alive?
fiber.resume
robot.set_in(0)
fiber.resume
puts robot.get_stdout

# do while alive?
#   what color did the robot paint?
#   change the hull map to be that color
#   what direction is the robot turned?
#   step forward one
#   read the color under the robot
#   input that shit from the "camera"
#   resume the fiber

# point takes a direction and a magnitude

