# --- Day 3: Spiral Memory ---
# http://adventofcode.com/2017/day/3


# def draw_map():
#     return list(map(lambda x: {'right': x, 'up': x, 'left': x+1, 'down': x+1}, range(1, 50)))


# read in unique puzzle text
# opens a file and reads into a return value
def get_input():
    fh = open("input.txt")
    file_input = fh.read().strip()
    fh.close()
    return file_input


# answer to puzzle part one
# puzzle -> answer
def part_one(puzzle_input):
    return list(map(lambda x: x.split(' '), puzzle_input))


# answer to puzzle part two
# puzzle -> answer
def part_two():
    pass


# my version of hello world: it takes nihilism and despair and returns encouragement
# none -> string
def get_encouragement():
    fh = open("input.txt")
    puzzle_input = fh.read().strip()
    fh.close()
    return puzzle_input


# print(part_one(get_input()))

# 1 (0, 0)
# 2 (1, 0)
# 3 (1, 1)
# 4 (0, 1)
# 5 (-1, 1)
# 6 (-1, 0)
# 7 (-1, -1)
# 8 (-1, 0)
# 9 (1, -1)

# n = 1
# (start) (right + n) (up + n) (left + n+1) (down + n+1) (right + n+2) (up + n+2) (left + n+4) (down + n+4) (right + n+5)
