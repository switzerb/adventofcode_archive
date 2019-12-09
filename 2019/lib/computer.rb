## --- Day 2: 1202 Program Alarm ---  ##
# https://adventofcode.com/2019/day/2  #
 class Computer

  def initialize
		@diagnostic = 0
  end

  def load(program)
    @program = program.dup
  end

  def run_with(noun, verb)
    @program[1] = noun
    @program[2] = verb
    run
    @program[0]
  end

  def get_code(s)
		raise Error "Not a valid code" if s.nil?
		s = s.to_s.chars.map(&:to_i)
		len = s.length
		return s[0] if len == 1
		s = s.last(2).join
		s.to_i
  end

	def get_mode(s, param)
		s = s.to_s.chars.map(&:to_i)
		return 0 if s.length <= 2
		s.pop(2)
		s = s.reverse
		s[param - 1].nil? ? 0 : s[param - 1]
	end

  def run
    @ip = 0
    until @ip >= @program.length do
			instructions = @program[@ip]
      code = get_code(instructions)

      p1 = Instruction.new
      p1.mode = get_mode(instructions, 1)
      p1.value = @program[@ip + 1]
      
      if(code == 2 || code == 1) then
        p2 = Instruction.new
        p2.mode = get_mode(instructions, 2)
        p2.value = @program[@ip + 2]

        address = @program[@ip + 3]
      end

     return if code == 99
     raise "" unless (code == 1 || code == 2 || code == 3 || code == 4 || code == 99)

     if code == 1
       opcode_1(p1, p2, address)
       @ip += 4
     elsif code == 2
       opcode_2(p1, p2, address)
       @ip += 4
     elsif code == 3
      opcode_3(1, p1)
      @ip += 2
     elsif code == 4
      opcode_4(p1)
      @ip += 2
     end
			# puts "count #{@ip}"
    end
  end

  def opcode_1(p1, p2, address)
    v1 = p1.mode == 0 ? @program[p1.value] : p1.value
    v2 = p2.mode == 0 ? @program[p2.value] : p2.value

    @program[address] = v1 + v2
  end

  def opcode_2(p1, p2, address)
    v1 = p1.mode == 0 ? @program[p1.value] : p1.value
    v2 = p2.mode == 0 ? @program[p2.value] : p2.value
    
    @program[address] = v1 * v2
  end

  def opcode_3(input, p1)
		@program[p1.value] = input
  end

  def opcode_4(p1)
		# puts "output: #{@program[p1.value]}"
		@diagnostic = @program[p1.value]
  end

  def finish
    @program
  end

	def diagnostic
		@diagnostic
	end

end

class Instruction
	attr_accessor :code
  attr_accessor :mode
  attr_accessor :value
	attr_accessor :address
	attr_accessor :paramA
	attr_accessor :paramB

  def to_s
    "[mode: #{mode}, value: #{value}]"
  end
end

class Param
	attr_accessor :mode
	attr_accessor :value

  def to_s
    "[mode: #{mode}, value: #{value}]"
  end
end
