

# answer to puzzle part one
# puzzle -> answer
def part_one():
    pass


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


print(get_encouragement())
