class Intcode
	def initialize(computer)
		execute(computer) if computer
	end
end

class Add < Intcode
 def execute(computer)
	 a = computer.get_param
	 b = computer.get_param
	 addr = computer.get_address
	 computer.set_address(addr, a + b)
 end
end

class Multiply < Intcode
 def execute(computer)
	 a = computer.get_param
	 b = computer.get_param
	 addr = computer.get_address
	 computer.set_address(addr, a * b)
 end
end

class Input < Intcode
 def execute(computer)
	i = computer.get_in
	a = computer.get_address
	computer.set_address(a,i)
 end
end

class Output < Intcode
 def execute(computer)
	 a = computer.get_param
	 computer.set_out(a)
 end
end

class JumpIfTrue < Intcode
	def execute(computer)
		a = computer.get_param
		b = computer.get_param
		computer.set_ip(b) if a != 0
	end
end

class JumpIfFalse < Intcode
	def execute(computer)
		a = computer.get_param
		b = computer.get_param
		computer.set_ip(b) if a == 0
	end
end

class LessThan < Intcode
	def execute(computer)
		a = computer.get_param
		b = computer.get_param
		addr = computer.get_address
		if a < b
			computer.set_address(addr, 1)
		else
			computer.set_address(addr, 0)
		end
	end
end

class Equals < Intcode
	def execute(computer)
		a = computer.get_param
		b = computer.get_param
		addr = computer.get_address
		if a == b
			computer.set_address(addr, 1)
		else
			computer.set_address(addr, 0)
		end
	end
end

