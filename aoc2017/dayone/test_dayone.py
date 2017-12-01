import unittest
import aoc2017.dayone.puzzle as puzzle


class TestDayOne(unittest.TestCase):

    def test_get_encouragement(self):
        self.assertEqual(puzzle.get_encouragement(), "You can do this.")

    def test_example_one(self):
        self.assertEqual(puzzle.part_one('1122'), 3)

    def test_example_two(self):
        self.assertEqual(puzzle.part_one('1111'), 4)

    def test_example_three(self):
        self.assertEqual(puzzle.part_one('1234'), 0)

    def test_example_four(self):
        self.assertEqual(puzzle.part_one('91212129'), 9)

    def test_get_answer(self):
        self.assertEqual(puzzle.part_one(puzzle.get_input()), 1144)
