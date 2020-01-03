#!/usr/bin/env ruby
require_relative '../lib/computer.rb'
require_relative '../lib/point.rb'
require 'pry'

class Arcade
  attr_accessor :computer, :stream, :screen

  EMPTY = 0
  WALL = 1
  BLOCK = 2
  PADDLE = 3
  BALL = 4

  def initialize(program)
    @computer = Computer.new
    @computer.load(program)
    @screen = Hash.new(0)
  end

  def boot
    @computer.run
    instructions = @computer.stdout
    @stream = instructions.each_slice(3)
  end

  def draw
    @stream.each do |item|
      p = Point.new(item[0], item[1])
      @screen[p] = item[2]
    end
  end

  def block_count
    blocks = @screen.values
    filtered = blocks.select { |value| value == 2 }
    filtered.length
  end

  def print
    level = 0
    p = "\n\n"
    @screen.each do |k,type|
      if k.y > level
        p += "\n"
        level = k.y
      end
      case type
      when 0 then p += " "
      when 1 then p += "#"
      when 2 then p += "X"
      when 3 then p += "_"
      when 4 then p += "O"
      else p += "~"
      end
    end
    p
  end
end
