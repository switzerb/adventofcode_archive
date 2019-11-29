import unittest
import aoc2016.DayOne as d

example_one = "R2, L3"
example_two = "R2, R2, R2"
example_three = "R5, L5, R5, R3"


class TestDayOne(unittest.TestCase):

    def test_turn_right(self):
        self.assertEquals(d.turn("R2"), "R")

    def test_turn_left(self):
        self.assertEquals(d.turn("L3"), "L")

    def test_parse_input(self):
        self.assertEqual(d.parse_input(example_one), [('R', 2), ('L', 3)])

    def test_parse_input_again(self):
        self.assertEqual(d.parse_input(example_two), [('R', 2), ('R', 2), ('R', 2)])

    def test_distance_right(self):
        self.assertEquals(d.distance("R2"), 2)

    def test_distance_left(self):
        self.assertEquals(d.distance("L3"), 3)

    def test_distance_double(self):
        self.assertEquals(d.distance("L34"), 34)

    def test_split(self):
        self.assertEquals(d.split_input("R2, L3"), ["R2", "L3"])

    def test_face_north(self):
        self.assertEqual(d.face('north', 'R'), 'east')

    def test_face_west(self):
        self.assertEqual(d.face('west', 'L'), 'south')

    def test_walk_north_right(self):
        self.assertEquals(d.walk({'x': 0, 'y': 0, 'facing': 'north'}, ('R', 2)), {'x': 2, 'y': 0, 'facing': "east"})

    def test_walk_north_left(self):
        self.assertEquals(d.walk({'x': 0, 'y': 0, 'facing': 'north'}, ('L', 2)), {'x': -2, 'y': 0, 'facing': "west"})

    def test_walk_second(self):
        self.assertEquals(d.walk({'x': 2, 'y': 0, 'facing': 'east'}, ('L', 3)), {'x': 2, 'y': 3, 'facing': 'north'})

    def test_walk_third(self):
        self.assertEquals(d.walk({'x': 0, 'y': 0, 'facing': 'north'}, ('L', 3)), {'x': -3, 'y': 0, 'facing': 'west'})

    def test_walk_fourth(self):
        self.assertEquals(d.walk({'x': 0, 'y': 0, 'facing': 'east'}, ('R', 2)), {'x': 0, 'y': -2, 'facing': 'south'})

    def test_destination(self):
        self.assertEquals(d.end(example_one), {'x': 2, 'y': 3, 'facing': 'north'})

    def test_distance_ex1(self):
        self.assertEquals(d.total_distance(d.end(example_one)), 5)

    def test_distance_ex2(self):
        self.assertEquals(d.total_distance(d.end(example_two)), 2)

    def test_distance_ex3(self):
        self.assertEquals(d.total_distance(d.end(example_three)), 12)

    def test_part_one(self):
        self.assertGreater(d.total_distance(d.end(puzzle_input)), 18)