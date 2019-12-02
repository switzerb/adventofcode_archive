## --- Day 2: 1202 Program Alarm ---  ##
# https://adventofcode.com/2019/day/2  #
 class Intcode

  def initialize(input)
    @program = input.map(&:to_i)
    @reset = input.map(&:to_i)
    @count = 0
  end

  def run
    until @count >= @program.length do
     opcodes = @program.slice(@count, @count + 4) 
     code = opcodes[0]
     p1 = opcodes[1]
     p2 = opcodes[2]
     w = opcodes[3] 
     
     return if code == 99
     #raise Error unless (op == 1 || op == 2 || op == 99)

     if code == 1
      value = @program[p1] + @program[p2]
     elsif code == 2
      value = @program[p1] * @program[p2]
     end
    
     @program[w] = value
     @count += 4
    end
  end

  def part_two(target)
    (0..15).each do |p1|
     (0..15).each do |p2|
        @program = @reset.dup
        @program[1] = p1
        @program[2] = p2
        run
        if part_one == target
          return 100 * p1 + p2
        end
      end
    end
  end

  def part_one
    @program[0]
  end

  def finish
    @program
  end

end
