
 class Point
   attr_accessor :x, :y, :dir
   alias_method :==, :eql?

   def initialize(x=0,y=0)
     @x = x
     @y = y
   end

   def step(dir, n=1)
     send(dir, n)
   end

   def north(n)
     Point.new(@x, @y - n)
   end

   def south(n)
     Point.new(@x, @y + n)
   end

   def west(n)
     Point.new(@x - n, @y)
   end

   def east(n)
     Point.new(@x + n, @y)
   end

   def to_s
    "[#{@x},#{@y}]"
   end

   def hash
     @x + @y
   end

   def eql?(other)
     other.x == self.x && other.y == self.y
   end

   def <=>(other)
     return self.x - other.x unless self.x == other.x
     return self.y - other.y unless self.y == other.y
     return 0
   end

 end
