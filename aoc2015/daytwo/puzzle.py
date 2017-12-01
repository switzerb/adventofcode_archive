# http://adventofcode.com/2015/day/2

data = open("input.txt").read().strip()


def get_encouragement():
    return "You can do this."

def split_presents(presents):
    return presents.splitlines()


print(data.splitlines())
