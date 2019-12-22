
 class Point
   attr_accessor :x, :y
   alias_method :==, :eql?

   def initialize(x,y)
     @x = x
     @y = y
   end

   def up(steps=1)
     @y -= steps
   end

   def down(steps=1)
     @y += steps
   end

   def left(steps=1)
     @x -= steps
   end

   def right(steps=1)
     @x += steps
   end

   def to_s
    "[#{@x},#{@y}]"
   end

   def hash
     @x + @y
   end

   def eql?(other)
     other.class == self.class && other.state == self.state
   end
   
   def state
     self.instance_variables.map { |variable| self.instance_variable_get variable }
   end

 end
