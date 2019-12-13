#!/usr/bin/env ruby

 class SIF
  
	 def initialize(input, width, height)
		 @data = input
		 @width = width
		 @height = height
		 @layers = []
		 @image = 
	 end

	 def part_one
		 layer = 0
		 i = 0
		 @data.each_slice(@width) do |a|
			 @layers[layer] = [] if @layers[layer].nil?
			 @layers[layer].concat(a)
			 layer += 1 if i % @height == @height - 1
			 i += 1
		 end

		min = 1000
		idx = 0

		@layers.each_with_index do |layer, index|
			zeros = layer.select {|item| item == 0 }
			if zeros.length < min
				min = zeros.length
				idx = index
			end
		end

		ones = @layers[idx].select{|item| item == 1}
		twos = @layers[idx].select{|item| item == 2}

		ones.length * twos.length
	 end

	 def part_two
		 layer = 0
		 i = 0
		 @data.each_slice(@width) do |a|
		 	 # puts a.to_s
			 @image[layer] = [] if @image[layer].nil?
			 @image[layer] << a
			 layer += 1 if i % @height == @height - 1
			 i += 1
		 end
		 @image[0][0].to_s
	 end

 end
