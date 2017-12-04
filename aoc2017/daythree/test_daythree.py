import unittest
import aoc2017.daythree.puzzle as puzzle


class TestDayThree(unittest.TestCase):

    def test_get_encouragement(self):
        self.assertEqual(puzzle.get_encouragement(), "You can do this.")
