require_relative '../lib/computer'
require 'fiber'
require 'pry'
require_relative 'amplifier'

phase_array = [0,1,2,3,4]
phase_sequences = phase_array.permutation.to_a

file = File.open(__dir__ + "/input.txt")
program = file.read
program = program.split(",")
program = program.map(&:to_i)

max = 0
$debug = false

phases = [9,8,7,6,5]

tester = Amplifier.new phases
tester.load([3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5])
tester.run
puts tester.to_thrusters

exit

amps = Array.new
fibers = Array.new
phases = [9,8,7,6,5]
A,B,C,D,E = 0,1,2,3,4

# create, load, provide phases and start each of the five amplifiers in a fiber
5.times do |i|
	amps[i] = Computer.new
	amps[i].load([3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5])
	amps[i].set_in(phases[i])
	fibers[i] = Fiber.new { amps[i].run }
end

amps[A].set_in(0)

def some_alive?(fibers)
	fibers.each do |f|
		return true if f.alive?
	end
	false
end

phases.each do |phase|
  while some_alive?(fibers)
		(0...5).each do |i|
			binding.pry if $debug
			prev = (i - 1) % amps.length
			signal = amps[prev].get_out
			amps[i].set_in(signal) unless signal.nil?
			fibers[i].resume
	  end
	end
	puts amps[E].get_out
end


exit

phase_sequences.each do |seq|
	signal = 0
	seq.each do |p|
		amp = Computer.new
		amp.load(program)
		fiber = Fiber.new { amp.run }
		fiber.resume
		amp.set_in(p)
		amp.set_in(signal)
		fiber.resume
		signal =  amp.get_out
		binding.pry if $debug
	end

	if signal > max
		max = signal
	end
end

puts "part one:" + max.to_s




#f = Fiber.new { amps["A"].run }
#f.resume
#amps["A"].set_in(3)
#f.resume
#amps["A"].set_in(0)
#f.resume
#puts amps["A"].get_out

