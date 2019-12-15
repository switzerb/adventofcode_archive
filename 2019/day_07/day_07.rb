#!/usr/bin/env ruby
require_relative '../lib/computer'

phase_array = [0,1,2,3,4]
phase_sequences = phase_array.permutation.to_a

file = File.open(__dir__ + "/input.txt")
program = file.read
program = program.split(",")
program = program.map(&:to_i)

max = 0

phase_sequences.each do |seq|
	signal = 0
	seq.each do |p|
		amp = Computer.new
		amp = amp.set_in(p)
		amp = amp.set_in(signal)
		amp.load(program)
		amp.run
		signal = amplifier.get_out
	end

	if signal > max
		max = signal
	end
end

puts "part one:" + max.to_s


# https://ruby-doc.org/core-2.5.0/Fiber.html
