#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_11.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class Day11Test < Minitest::Test
   def setup
     program = File.readlines(__dir__ + "/input.txt")
     puts program
     @robot = PaintRobot.new(program)
   end

 end
