#!/usr/bin/env ruby
require_relative '../lib/computer'
require 'fiber'

 class PaintRobot
   attr_accessor :robot, :brain, :hull, :position, :dir

  def initialize    
    @robot = Computer.new

    # state of hull grid colors
    # position (0,0)
    # direction (up)
  end

  def load(program)
    @robot.load(program)
    @brain = Fiber.new { @robot.run }
  end

  def go
    input 0
    @brain.resume
    output
  end

  def output
    puts @robot.stdout
  end

  def input(n)
    @robot.set_in(n)
  end

 end

$debug = true

file = File.open(__dir__ + "/input.txt")
input = file.read
robot = PaintRobot.new
robot.load(input)
puts robot.go


# do while alive?
#   what color did the robot paint?
#   change the hull map to be that color
#   what direction is the robot turned?
#   step forward one
#   read the color under the robot
#   input that shit from the "camera"
#   resume the fiber

# point takes a direction and a magnitude

