import unittest

puzzle_input = open("inputs/day_02_input.txt").read().strip()

example_input = ["ULL", "RRDDD", "LURDL", "UUUUD"]

keypad = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

real_keypad = {
    '1': {'U': '1', 'D': '3', 'L': '1', 'R': '1'},
    '2': {'U': '2', 'D': '6', 'L': '2', 'R': '3'},
    '3': {'U': '1', 'D': '7', 'L': '2', 'R': '4'},
    '4': {'U': '4', 'D': '8', 'L': '3', 'R': '4'},
    '5': {'U': '5', 'D': '5', 'L': '5', 'R': '6'},
    '6': {'U': '2', 'D': 'A', 'L': '5', 'R': '7'},
    '7': {'U': '3', 'D': 'B', 'L': '6', 'R': '8'},
    '8': {'U': '4', 'D': 'C', 'L': '7', 'R': '9'},
    '9': {'U': '9', 'D': '9', 'L': '8', 'R': '9'},
    'A': {'U': '6', 'D': 'A', 'L': 'A', 'R': 'B'},
    'B': {'U': '7', 'D': 'D', 'L': 'A', 'R': 'C'},
    'C': {'U': '8', 'D': 'C', 'L': 'B', 'R': 'C'},
    'D': {'U': 'B', 'D': 'D', 'L': 'D', 'R': 'D'}
}

movement = {
    'L': (0, -1),
    'D': (1, 0),
    'U': (-1, 0),
    'R': (0, 1)
}


def split_input(x):
    return x.split('\n')


def process((y, x)):
    if x < 0:
        x = 0
    if y < 0:
        y = 0
    if x > 2:
        x = 2
    if y > 2:
        y = 2
    return y, x


def follow((y, x), direction):
    (new_y, new_x) = movement[direction]
    return process((y + new_y, x + new_x))


def calculate(instructions, position):
    return reduce(follow, instructions, position)


def translate(coordinate):
    return keypad[coordinate[0]][coordinate[1]]


def codes(instructions, current):
    def lmbda(a, i):
        next = calculate(i, a['current'])
        return {'current': next, 'code': a['code'] + [next]}
    return reduce(lmbda, instructions, {'current': current, 'code': [current]})


def translate_code(instructions):
    code_array = codes(instructions, (1, 1))
    return map(translate, code_array['code'][1:])


def translate_part2(key, direction):
    return real_keypad[key][direction]


def calculate_part2(instructions, position):
    return reduce(translate_part2, instructions, position)


def codes_part2(instructions, current):
    def lmbda(a, i):
        next = calculate_part2(i, a['current'])
        return {'current': next, 'code': a['code'] + [next]}
    return reduce(lmbda, instructions, {'current': current, 'code': [current]})


def translate_codes_part2(instructions, current):
    final = codes_part2(instructions, current)
    return final['code'][1:]

print translate_codes_part2(split_input(puzzle_input), '5')


class TestDayTwo(unittest.TestCase):
    def test_process(self):
        self.assertEquals(process((5, -3)), (2, 0))

    def test_process_again(self):
        self.assertEquals(process((-5, 16)), (0, 2))

    def test_follow_up(self):
        self.assertEquals(follow((1, 1), 'U'), (0, 1))

    def test_translate_up(self):
        self.assertEquals(translate(follow((1, 1), 'U')), 2)

    def test_translate_down(self):
        self.assertEquals(translate(follow((1, 1), 'D')), 8)

    def test_translate_left(self):
        self.assertEquals(translate(follow((1, 1), 'L')), 4)

    def test_translate_right(self):
        self.assertEquals(translate(follow((1, 1), 'R')), 6)

    def test_calculate(self):
        self.assertEquals(calculate("ULL", (1, 1)), (0, 0))

    def test_calculate2(self):
        self.assertEquals(calculate("RRDDD", (0, 0)), (2, 2))

    def test_calculate3(self):
        self.assertEquals(calculate("LURDL", (2, 2)), (2, 1))

    def test_calculate4(self):
        self.assertEquals(calculate("UUUUD", (2, 1)), (1, 1))

    def test_follow_down(self):
        self.assertEquals(follow((1, 1), 'D'), (2, 1))

    def test_follow_right(self):
        self.assertEquals(follow((1, 1), 'R'), (1, 2))

    def test_follow_left(self):
        self.assertEquals(follow((1, 1), 'L'), (1, 0))

    def test_codes(self):
        self.assertEquals(codes(example_input, (1, 1)), {'current': (1, 1), 'code': [(1, 1), (0, 0), (2, 2), (2, 1), (1, 1)]})

    def test_translate_code(self):
        self.assertEquals(translate_code(example_input), [1, 9, 8, 5])

    def test_real_keyboard(self):
        self.assertEquals(real_keypad['1']['U'], '1')

    def test_translate_part2(self):
        self.assertEquals(translate_part2('1', 'U'), '1')

    def test_translate_part2_2(self):
        self.assertEquals(translate_part2('D', 'U'), 'B')

    def test_translate_codes_part2(self):
        self.assertEquals(translate_codes_part2(example_input, '5'), ['5', 'D', 'B', '3'])

suite = unittest.TestLoader().loadTestsFromTestCase(TestDayTwo)
unittest.TextTestRunner(verbosity=2).run(suite)

# TODO: implement a generic version of scan which returns a list of the aggregators in an array