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
   end

 end
