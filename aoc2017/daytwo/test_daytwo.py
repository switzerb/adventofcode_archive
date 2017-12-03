import unittest
import aoc2017.daytwo.puzzle as puzzle


class TestDayTwo(unittest.TestCase):

    def test_example_one(self):
        self.assertEqual(puzzle.part_one([[5, 1, 9, 5], [7, 5, 3],[2, 4, 6, 8]]), 18)

    def test_get_max(self):
        self.assertEqual(puzzle.get_max([5, 1, 9, 5]), 9)

    def test_get_min(self):
        self.assertEqual(puzzle.get_min([5, 1, 9, 5]), 1)

    def test_part_one(self):
        self.assertEqual(puzzle.part_one(puzzle.parse(puzzle.get_input())), 42299)