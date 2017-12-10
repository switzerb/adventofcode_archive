# --- Day 5: A Maze of Twisty Trampolines, All Alike ---
# http://adventofcode.com/2017/day/5 #

import functools
import itertools

example = [0, 3, 0, 1, -3]


# read in unique puzzle text
# opens a file and reads into a return value
def get_input():
    fh = open("input.txt")
    file_input = fh.read().strip()
    fh.close()
    return file_input


def parse(p_input):
    return list(map(lambda x: int(x), p_input.splitlines()))


# answer to puzzle part one: get in a list of instructions and reduce until we "escape" the list -- meaning we are out of range on our list
# the answer is the index value, which is the number of steps we've taken to get out of range
# list -> index
def part_one(p_input):
    answer = 0
    current = 0

    for i in range(0, 400000):
        try:
            temp = current
            current += p_input[current]
            p_input[temp] += 1
        except IndexError:
            answer = i
            break
    return answer


# answer to puzzle part two
# puzzle -> answer
def part_two():
    pass


print(part_one(parse(get_input())))
