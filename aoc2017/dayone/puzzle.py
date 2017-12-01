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
    return convert(list(input))


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


def get_halfway(data):
    return int(len(data) / 2)


def ncycles(iterable, n):
    "Returns the sequence elements n times"
    return itertools.chain.from_iterable(itertools.repeat(tuple(iterable), n))


print(list(ncycles('1234', 2)))


def get_match(i):
    index, num = i

    # this is bad
    data = get_input()

    # this is also bad
    halfway = get_halfway(data)

    match = halfway + int(index)

    if match > len(data):
        # the length the string subtract the index, then subtract that from halfway and start count from beginning
        steps_to_end = (len(data) - 1) - index
        steps = halfway - steps_to_end - 1
        if data[steps] == data[index]:
            return int(data[index])
        else:
            return 1
    else:
        if int(data[match - 1]) == int(data[index]):
            return int(data[index])
        else:
            return 0



def part_two(puzzle_input):
    return functools.reduce(lambda a, i: a + i, map(get_match, enumerate(puzzle_input)))



def get_encouragement():
    return "You can do this."


# print(list(halfway_pairwise(get_input())))