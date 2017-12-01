import unittest
import aoc2015.daytwo.puzzle as puzzle


class TestDayZero(unittest.TestCase):

    def test_get_encouragement(self):
        self.assertEqual(puzzle.get_encouragement(), "You can do this.")
