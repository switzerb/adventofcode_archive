# --- Day 3: Spiral Memory ---
# http://adventofcode.com/2017/day/3

import functools

def draw_grid():
    # R1 U1 L2 D2 R3 U3 L4 D4 R5

    def move(grid, count):
        [current_x, current_y] = grid[len(grid) - 1]['square']
        num = grid[count]['num']
        steps = ['RIGHT', 'UP', 'LEFT', 'DOWN']
        direction = steps[count % len(steps)]
        increment = count

        if count > 0:
            if count % 2 == 0:
                count = count - 1
                print(count)
            else:
                print(count)

        if direction == 'RIGHT':
            current_y += increment
        elif direction == 'UP':
            current_x += increment
        elif direction == 'LEFT':
            current_x = current_x - increment
        elif direction == 'DOWN':
            current_y = current_y - increment

        # print([current_x, current_y])
        # print(" ")
        num += 1
        return grid + [{'num': num, 'square': [current_x, current_y]}]
    return list(functools.reduce(move, range(0, 10), [{'num': 1, 'square': [0, 0]}]))


# read in unique puzzle text
# opens a file and reads into a return value
def get_input():
    fh = open("input.txt")
    file_input = fh.read().strip()
    fh.close()
    return file_input


# answer to puzzle part one
# puzzle -> answer
def part_one(puzzle_input):
    return list(map(lambda x: x.split(' '), puzzle_input))


# answer to puzzle part two
# puzzle -> answer
def part_two():
    pass


print(draw_grid())

# 1 (0, 0)
# 2 (1, 0)
# 3 (1, 1)
# 4 (0, 1)
# 5 (-1, 1)
# 6 (-1, 0)
# 7 (-1, -1)
# 8 (-1, 0)
# 9 (1, -1)

# n = 1
# (start) (right + n) (up + n) (left + n+1) (down + n+1) (right + n+2) (up + n+2) (left + n+4) (down + n+4) (right + n+5)
