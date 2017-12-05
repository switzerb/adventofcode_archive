import unittest
import aoc2017.dayfour.puzzle as puzzle


class TestDayFour(unittest.TestCase):

    def test_example_one(self):
        self.assertEqual(puzzle.part_one(), "You can do this.")
