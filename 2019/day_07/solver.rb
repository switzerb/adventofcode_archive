require_relative '../lib/computer'

phase_array = [0,1,2,3,4]
phase_sequences = phase_array.permutation.to_a
# puts phase_sequences.to_s

file = File.open(__dir__ + "/input.txt")
program = file.read
program = program.split(",")
program = program.map(&:to_i)

max = 0

phase_sequences.each do |seq|
	puts seq.to_s
	input = 0
	seq.each do |p|
		amplifier = Computer.new(input,p)
		amplifier.load(program)
		amplifier.run
		input = amplifier.diagnostic
	end

	if input > max
		max = input
	end
end

puts "part one:" + max.to_s


# https://ruby-doc.org/core-2.5.0/Fiber.html
