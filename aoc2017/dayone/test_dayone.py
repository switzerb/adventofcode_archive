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

    def test_get_answer_part_one(self):
        self.assertEqual(puzzle.part_one(puzzle.get_input()), 1144)

    def test_get_halfway(self):
        self.assertEqual(puzzle.get_halfway('1212'), 2)

    # # the matched index is inside the range of the length of the total
    # def test_get_match_in_range(self):
    #     self.assertEqual(puzzle.get_match('1212',0), 1)
    #
    # # the matched index requires looping to the beginning of the list
    # def test_get_match_outside_range(self):
    #     self.assertEqual(puzzle.get_match('12131415', 6), 1)

    def test_example_five(self):
        self.assertEqual(puzzle.part_two('1212'), 6)

    def test_example_six(self):
        self.assertEqual(puzzle.part_two('1221'), 0)

    def test_example_seven(self):
        self.assertEqual(puzzle.part_two('123425'), 4)

    def test_example_eight(self):
        self.assertEqual(puzzle.part_two('123123'), 12)

    def test_example_nine(self):
        self.assertEqual(puzzle.part_two('12131415'), 4)

    def test_get_answer_part_two(self):
        self.assertEqual(puzzle.part_two(puzzle.get_input()), 0)


