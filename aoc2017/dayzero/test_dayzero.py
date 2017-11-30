import unittest
import aoc2017.dayzero.dayzero as do


class TestDayZero(unittest.TestCase):

    def test_hello(self):
        self.assertEqual(do.get_hello(), "hello, barney!!")
