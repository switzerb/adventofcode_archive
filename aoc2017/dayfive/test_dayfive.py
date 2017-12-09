import unittest
import aoc2017.dayfive.puzzle as puzzle


class TestDayFive(unittest.TestCase):

    def test_get_encouragement(self):
        self.assertEqual(puzzle.get_encouragement(), "You can do this.")
