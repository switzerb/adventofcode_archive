import unittest
import aoc2017.daytwo.puzzle as puzzle


class TestDayTwo(unittest.TestCase):

    def test_get_encouragement(self):
        self.assertEqual(puzzle.get_encouragement(), "You can do this.")
