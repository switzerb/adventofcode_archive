class CodeManual

  def initialize(start)
   @start = start
  end

  def count_to(row, col)
    to = (row + col) - 1
    (0...to).sum + col
  end

  def get_next_code(current)
    (current * 252533) % 33554393 
  end

  def get_code(row, col)
    solution = 0
    count = count_to(row, col)
    current = @start
    (1..count).each do |n|
      if n == count
        solution = current
      end
      current = get_next_code(current)
    end
   solution 
  end
end
