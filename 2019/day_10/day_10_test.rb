#!/usr/bin/env ruby

  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative 'day_10.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class Day10Test < Minitest::Test
   def setup
     ex1 = <<~INPUT
      .#..##.###...#######
      ##.############..##.
      .#.######.########.#
      .###.#######.####.#.
      #####.##.#.##.###.##
      ..#####..#.#########
      ####################
      #.####....###.#.#.##
      ##.#################
      #####.##.###..####..
      ..######..##.#######
      ####.##.####...##..#
      .#####..#.######.###
      ##...#.##########...
      #.##########.#######
      .####.#.###.###.#.##
      ....##.##.###..#####
      .#.#.###########.###
      #.#.#.#####.####.###
      ###.##.####.##.#..##
     INPUT

     ex2 = <<~INPUT
     .#..#
     .....
     #####
     ....#
     ...##
     INPUT

     @ex1 = ex1.split("\n").map(&:chars)
     @ex2 = ex2.split("\n").map(&:chars)
   end

   def test_vaporize_1
     asteroids = Asteroids.new(@ex2)
     station = Point.new(3,4)

     puts Math.atan2(-2,0)

   end
 end
