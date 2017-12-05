import unittest
import aoc2017.dayfour.puzzle as puzzle


class TestDayFour(unittest.TestCase):

    def test_get_encouragement(self):
        self.assertEqual(puzzle.get_encouragement(), "You can do this.")
