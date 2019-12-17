class Intcode
  def initialize(c)
    execute(c) if c
  end
end

class Add < Intcode
 def execute(c)
   a = c.get_param
   b = c.get_param
   addr = c.get_address
   c.set_address(addr, a + b)
   puts "Add #{a} + #{b} at address #{addr}" if $debug
 end
end

class Multiply < Intcode
 def execute(c)
   a = c.get_param
   b = c.get_param
   addr = c.get_address
   c.set_address(addr, a * b)
   puts "Multipy #{a} * #{b} at address #{addr}" if $debug
 end
end

class Input < Intcode
 def execute(c)
  i = c.get_in
  a = c.get_address
  c.set_address(a,i)
   puts "Input #{i} at address #{a}" if $debug
 end
end

class Output < Intcode
 def execute(c)
   a = c.get_param
   c.set_out(a)
   puts "Output #{a}" if $debug
 end
end

class JumpIfTrue < Intcode
  def execute(c)
    a = c.get_param
    b = c.get_param
    c.set_ip(b) if a != 0
    if a!= 0
      puts "JumpIfTrue #{a} != 0, set ip #{b}" if $debug
    else
      puts "JumpIfTrue #{a} is 0, do nothing" if $debug
    end
  end
end

class JumpIfFalse < Intcode
  def execute(c)
    a = c.get_param
    b = c.get_param
    c.set_ip(b) if a == 0
   puts "JumpIfFalse #{a} == 0, set ip #{b}" if $debug
  end
end

class LessThan < Intcode
  def execute(c)
    a = c.get_param
    b = c.get_param
    addr = c.get_address
    if a < b
      c.set_address(addr, 1)
      puts "LessThan #{a} is less than #{b}, set 1 at address #{addr}" if $debug
    else
      c.set_address(addr, 0)
      puts "LessThan #{a} is more than #{b}, set 0 at address #{addr}" if $debug
    end
  end
end

class Equals < Intcode
  def execute(c)
    a = c.get_param
    b = c.get_param
    addr = c.get_address
    if a == b
      c.set_address(addr, 1)
      puts "Equals #{a} == #{b}, set 1 at address #{addr}" if $debug
    else
      c.set_address(addr, 0)
      puts "Equals #{a} != #{b}, set 0 at address #{addr}" if $debug
    end
  end
end

class Relative < Intcode
  def execute(c)
    a = c.get_param
    base = c.get_base
    c.set_base(base + a)
    puts "Relative change base offset #{base} + #{a}, new base #{base + a}" if $debug
  end
end
