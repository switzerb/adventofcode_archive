# --- Day 2: Corruption Checksum ---
# http://adventofcode.com/2017/day/2 #

import functools


# read in unique puzzle text
# opens a file and reads into a return value
def get_input():
    fh = open("input.txt")
    file_input = fh.read().strip().splitlines()
    fh.close()
    return file_input


def parse(data):
    return list(map(lambda x: list(map(lambda y: int(y), x.split(','))), data))


def get_max(data):
    return max(data)


def get_min(data):
    return min(data)


# answer to puzzle part one
# puzzle -> answer
def part_one(puzzle_input):
    calc = map(lambda x: get_max(x) - get_min(x), puzzle_input)
    return functools.reduce(lambda a, i: a + i, calc, 0)


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


print(part_one(parse(get_input())))