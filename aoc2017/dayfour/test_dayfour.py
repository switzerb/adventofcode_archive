import unittest
import aoc2017.dayfour.puzzle as puzzle


class TestDayFour(unittest.TestCase):

    def test_example_one(self):
        self.assertEqual(puzzle.part_one(puzzle.parse('aa bb cc dd ee')), 1)

    def test_example_two(self):
        self.assertEqual(puzzle.part_one(puzzle.parse('aa bb cc dd aa')), 0)

    def test_example_three(self):
        self.assertEqual(puzzle.part_one(puzzle.parse('aa bb cc dd aaa')), 1)

    def test_parse(self):
        self.assertEqual(puzzle.parse('aa bb cc dd ee'), [['aa', 'bb', 'cc', 'dd', 'ee']])

    def test_create_pairs(self):
        self.assertEqual(puzzle.create_pairs(['aa', 'bb', 'cc', 'dd', 'ee']), [('aa', 'bb'), ('aa', 'cc'), ('aa', 'dd'), ('aa', 'ee'), ('bb', 'cc'), ('bb', 'dd'), ('bb', 'ee'), ('cc', 'dd'), ('cc', 'ee'), ('dd', 'ee')])

    def test_part_one(self):
        self.assertEqual(puzzle.part_one(puzzle.get_input()), 386)
