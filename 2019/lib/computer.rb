## --- Day 2: 1202 Program Alarm ---  ##
# https://adventofcode.com/2019/day/2  #
require 'pry'
require_relative 'intcode'
require 'fiber'


 class Computer
   attr_accessor :ip, :program, :stdin, :stdout, :mode

   POSITION = 0
   IMMEDIATE = 1
   RELATIVE = 2

   def initialize
     @stdout = []
     @stdin = []
     @mode = 0
     @base = 0
   end

   def load(program)
     program = parse(program) unless program.is_a? Array
     @program = program.dup
   end

   def parse(input)
     input.split(",").map(&:to_i)
   end

   def get_in
     Fiber.yield while @stdin.empty?
     @stdin.shift
   end

   def set_in(input)
     @stdin << input
   end

   def get_out
     @stdout.shift
   end

   def get_stdout
     @stdout
   end

   def set_out(output)
     @stdout << output
   end

   def set_base(base)
     @base = base
   end

   def get_base
     @base
   end

   def set_address(index, value)
     @program[index] = value
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
     case mode
      when POSITION then value = @program[temp]
      when IMMEDIATE then value = temp
      when RELATIVE then value = @program[temp + @base]
     end
     value.to_i
   end

   def get_address
     mode = @mode % 10
     @mode = @mode / 10

     temp = @program[@ip]
     increment

     case mode
      when POSITION then temp.to_i
      when RELATIVE then temp.to_i + @base
     end
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
       
       case code
         when 1 then Add.new self
         when 2 then Multiply.new self
         when 3 then Input.new self
         when 4 then Output.new self
         when 5 then JumpIfTrue.new self
         when 6 then JumpIfFalse.new self
         when 7 then LessThan.new self
         when 8 then Equals.new self
         when 9 then Relative.new self
       end

       return @program if code == 99
       raise "Opcode invalid." unless (code.between?(1,9) || code == 99)
     end
   end

   private def increment
     @ip += 1
   end
 end


