import unittest
import aoc2017.dayfour.puzzle as puzzle


class TestDayFour(unittest.TestCase):

    def test_example_one(self):
        self.assertEqual(puzzle.part_one(puzzle.part_one([['aa', 'bb', 'cc', 'dd', 'ee']])), 1)

    def test_example_two(self):
        self.assertEqual(puzzle.part_one(puzzle.part_one([['aa', 'bb', 'cc', 'dd', 'aa']])), 0)

    def test_example_three(self):
        self.assertEqual(puzzle.part_one(puzzle.part_one([['aa', 'bb', 'cc', 'dd', 'aaa']])), 0)

    def test_part_one(self):
        self.assertEqual(puzzle.part_one(puzzle.part_one(puzzle.get_input())), 386)
