def part_one():
    pass


def part_two():
    pass


def get_hello():
    fh = open("input.txt")
    input = fh.read().strip()
    fh.close()
    return input


print(get_hello())