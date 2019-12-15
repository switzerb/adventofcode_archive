## --- Day 2: 1202 Program Alarm ---  ##
# https://adventofcode.com/2019/day/2  #
require 'pry'
require_relative 'intcode'
require 'fiber'

 class Computer
	 attr_accessor :ip, :program, :stdin, :stdout, :mode

	 def initialize
		 @stdout = []
		 @stdin = []
		 @mode = 0
	 end

	 def load(program)
		 @program = program.dup
	 end

	 def get_in
		 Fiber.yield if @stdin.empty?
		 @stdin.shift
	 end

	 def set_in(input)
		 @stdin << input
	 end

	 def get_out
		 @stdout.pop
	 end

	 def set_out(output)
		 @stdout << output
	 end

	 def run_with(noun,verb)
		 @program[1] = noun
		 @program[2] = verb
		 self.run
		 @program[0]
	 end

	 def get_param
		 temp = @program[@ip]
		 mode = @mode % 10
		 @mode = @mode / 10
		 increment
		 @program[temp]
     mode == 0 ? @program[temp] : temp
	 end

	 def get_address
		 temp = @program[@ip]
		 increment
		 temp
	 end

	 def set_address(address, value)
		 @program[address] = value
	 end

	 def set_ip(value)
		 @ip = value
	 end

	 def run
		 raise Error "Program is empty." if @program.nil?
		 @ip = 0
		 until @ip > @program.length do
			 opcode = @program[@ip]
			 increment
			 code = opcode % 100
			 @mode = opcode / 100
			 #binding.pry
			 
			 case code
			   when 1 then Add.new self
				 when 2 then Multiply.new self
				 when 3 then Input.new self
				 when 4 then Output.new self
				 when 5 then JumpIfTrue.new self
				 when 6 then JumpIfFalse.new self
				 when 7 then LessThan.new self
				 when 8 then Equals.new self
			 end

			 return @program if code == 99
			 raise "Opcode invalid." unless (code.between?(1,8) || code == 99)
	   end
	 end

	 private def increment
		 @ip += 1
	 end
 end


