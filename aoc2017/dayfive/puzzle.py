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


def execute(n, i):
    instructions = n[i]['instructions'][:]
    current = n[i]['current']
    temp = current

    try:
        current += instructions[current]
        instructions[temp] += 1
        return n + [{'instructions': instructions, 'current': current}]
    except IndexError:
        return n + n


def is_exit(state):
    if state[1]['current'] < 0:
        return False
    if state[1]['current'] >= len(state[1]['instructions']):
        return False
    return True


# answer to puzzle part one: get in a list of instructions and reduce until we "escape" the list -- meaning we are out of range on our list
# the answer is the index value, which is the number of steps we've taken to get out of range
# list -> index
def part_one(p_input):
    init = [{'instructions': p_input, 'current': 0}]
    answer = itertools.dropwhile(is_exit, zip(itertools.count(start=0, step=1), functools.reduce(execute, itertools.count(start=0, step=1), init)))
    return list(itertools.islice(answer, 1))


# answer to puzzle part two
# puzzle -> answer
def part_two():
    pass


print(part_one(parse(get_input())))
