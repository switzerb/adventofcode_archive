import itertools
import functools

# read in unique puzzle text
# opens a file and reads into a return value
def get_input():
    fh = open("input.txt")
    file_input = map(lambda x: x.split(' '), fh.read().strip().splitlines())
    fh.close()
    return file_input


# answer to puzzle part one
# puzzle -> answer
def part_one(passcodes):
    split_passcodes = map(lambda x: list(itertools.combinations(x, 2)), passcodes)
    convert_to_boolean = map(check_equality, split_passcodes)
    return len(list(filter(lambda x: not x, convert_to_boolean)))


def check_equality(passcode):
    def is_equal(pair):
        a, b = pair
        return a == b
    return any(list(map(is_equal, passcode)))


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