import unittest
import re


# parse_file(str):str[]
def parse_file(x):
    return x.strip().split('\n')


def split_input(x):
    split = re.split('\[|\]', x)
    zipped = zip(split, range(1000))
    ip_open = map(lambda x: x[0], filter(lambda f: f[1] % 2 == 0, zipped))
    hyper_net = map(lambda x: x[0] , filter(lambda f: f[1] % 2 != 0, zipped))
    return ip_open, hyper_net


# is_abba(str):bool
def is_abba(s):
    if s[1] == s[3]:
        return False
    else:
        return s[0] + s[1] == s[3] + s[2]


# has_abba(str):bool
def has_abba(s):
    if len(s) < 4:
        return False
    elif is_abba(s[0:4]):
        return True
    else:
        return has_abba(s[1:])


# supports_tls( str[], str[]):bool
def supports_tls(ip):
    ip_open = filter(has_abba, ip[0])
    hyper_net = filter(has_abba, ip[1])

    if len(hyper_net) > 0:
        return False
    elif len(ip_open) == 0:
        return False
    else:
        return True


def part_one(input):
    parsed = map(split_input, parse_file(input))
    count = len(filter(supports_tls, parsed))
    return count


def part_two(input):
    True


class TestDaySeven(unittest.TestCase):

    def setUp(self):
        self.example_input_1 = 'abba[mnop]qrst'
        self.example_input_2 = 'abcd[bddb]xyyx'
        self.example_input_3 = 'aaaa[qwer]tyui'
        self.example_input_4 = 'ioxxoj[asdfgh]zxcvbn'

        self.puzzle_input = open("inputs/day_07_input.txt").read().strip()

    def test_canvas(self):
        True

    def test_is_abba(self):
        self.assertEquals(is_abba('abba'), True)

    def test_is_abba(self):
        self.assertEquals(is_abba('dddd'), False)

    def test_is_abba_neg(self):
        self.assertEquals(is_abba('qrst'), False)

    def test_has_abba(self):
        self.assertEquals(has_abba('abbaqrstyuipdkjsdhf'), True)

    def test_has_abba_neg(self):
        self.assertEquals(has_abba('abhaqrstyuipdkjsdhf'), False)

    def test_has_abba_short(self):
        self.assertEquals(has_abba('abh'), False)

    def test_supports_tls_one(self):
        self.assertEquals(supports_tls((['abba', 'qrst'], ['mnop'])), True)

    def test_supports_tls_two(self):
        self.assertEquals(supports_tls((['abcd', 'xyyx'], ['bddb'])), False)

    def test_supports_tls_three(self):
        self.assertEquals(supports_tls((['aaaa', 'tyui'], ['qwer'])), False)

    def test_supports_tls_four(self):
        self.assertEquals(supports_tls((['ioxxoj', 'zxcvbn'], ['asdfgh'])), True)

    def test_example_one(self):
        self.assertEquals(supports_tls(split_input(self.example_input_1)), True)

    def test_example_two(self):
        self.assertEquals(supports_tls(split_input(self.example_input_2)), False)

    def test_example_three(self):
        self.assertEquals(supports_tls(split_input(self.example_input_3)), False)

    def test_example_four(self):
        self.assertEquals(supports_tls(split_input(self.example_input_4)), True)

    def test_part_one(self):
        self.assertEquals(part_one(self.puzzle_input), 118)

    @unittest.skip("Part Two Test")
    def test_example_part_two(self):
        self.assertEquals(True, True)

    @unittest.skip("Part Two")
    def test_part_two(self):
        self.assertEquals(True, True)

suite = unittest.TestLoader().loadTestsFromTestCase(TestDaySeven)
unittest.TextTestRunner(verbosity=2).run(suite)