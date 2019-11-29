#--- Day 8: Two-Factor Authentication    ---#
#--- https://adventofcode.com/2016/day/8 ---#


class Screen

  def initialize(cols,rows)
    @cols = cols
    @rows = rows
    @grid = Array.new(cols * rows, 0) 
  end

  def rect(a, b)
    (0...b).each do |r|
      (0...a).each do |c|
        set_value(c,r,1)
      end
    end
  end

  def rotate_col(col, steps)
    (0...steps).each do 
      (0...@rows).each do |row|
        if row == 0
          temp = get_value(col, row)
          val = get_value(col, @rows - 1)
          set_value(col, row, val)
        #else 

        end


        #first = get_value(col, row)
        #second = get_value(col, row + 1)
        #set_value(col, row + 1, temp)
      end
    end
    puts
  end

  def set_value(col, row, value)
    @grid[get_index(col,row)] = value
  end

  def get_index(col,row)
    (@cols * row) + col
  end

  def get_value(col,row)
    @grid[get_index(col,row)] 
  end

  def to_s
    output =""
    (0...@rows).each do |r|
      (0...@cols).each do |c| 
        output += "." if get_value(c,r) == 0
        output += "#" if get_value(c,r) == 1
      end
      output += "\n"
    end
    output
  end

end

 class Solver
  def hello
    "hello, world!"
  end
 end
