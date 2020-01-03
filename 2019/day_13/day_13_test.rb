#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_13.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class Day13Test < Minitest::Test
   def setup
     file = File.open(__dir__ + "/input.txt")
     input = file.read
     program = input.split(",").map(&:to_i)
     @arcade = Arcade.new(program)
   end

   def test_boot
     @arcade.boot
     @arcade.draw
     puts @arcade.print
     puts @arcade.block_count
   end

 end
