# --- Day 1: Inverse Captcha ---
# http://adventofcode.com/2017/day/1 #

import functools
import itertools


# read in unique puzzle text
# opens a file and reads the values into a return value
def get_input():
    fh = open("input.txt")
    input = fh.read().strip()
    fh.close()
    return list(input)


# take list of integers and pair them into tuples for comparison
# list -> iterable
def pairwise(puzzle_input):
    # "s -> (s0,s1), (s1,s2), (s2, s3), ..."
    a, b = itertools.tee(puzzle_input)
    next(b, None)
    return zip(a, b)


def compare(iterator):
    def prune(x):
        if x[0] == x[1]:
            return int(x[0])
        else:
            return 0
    return map(prune, iterator)


def part_one(puzzle_input):
    total = functools.reduce(lambda a, i: a + i, compare(pairwise(puzzle_input)))
    if puzzle_input[0] == puzzle_input[-1]:
        total = total + int(puzzle_input[0])
    return total


def part_two():
    pass


def get_encouragement():
    return "You can do this."


print(part_one(get_input()))