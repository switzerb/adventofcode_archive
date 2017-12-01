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
    return convert(input)

def convert(data):
    return list(map(lambda x: int(x), data))


# take list of integers and pair them into tuples for comparison
# list -> iterable
def pairwise(puzzle_input):
    # "s -> (s0,s1), (s1,s2), (s2, s3), ..."
    a, b = itertools.tee(puzzle_input)
    next(b, None)
    return zip(a, b)


def compare(iterator):
    def prune(x):
        prev, current = x
        if prev == current:
            return int(current)
        else:
            return 0
    return map(prune, iterator)


def part_one(puzzle_input):
    total = functools.reduce(lambda a, i: a + i, compare(pairwise(puzzle_input)))
    if puzzle_input[0] == puzzle_input[-1]:
        total = total + int(puzzle_input[0])
    return total


def get_halfway(data):
    return int(len(data) / 2)


def ncycles(iterable, n):
    "Returns the sequence elements n times"
    return itertools.chain.from_iterable(itertools.repeat(tuple(iterable), n))


def get_match(i):
    index, num = i

    # this is bad
    data = get_input()

    # this is also bad
    halfway = get_halfway(data)
    match = halfway + int(index)
    cycle_data = list(ncycles(data, 2))

    if num == cycle_data[match]:
        return num
    else:
        return 0


def part_two(puzzle_input):
    return functools.reduce(lambda a, i: a + i, map(get_match, enumerate(puzzle_input)))


def get_encouragement():
    return "You can do this."


print(part_two(get_input()))