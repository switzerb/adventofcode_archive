# --- Day 3: Spiral Memory ---
# http://adventofcode.com/2017/day/3


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
    return puzzle_input


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


print(part_one(get_input()))