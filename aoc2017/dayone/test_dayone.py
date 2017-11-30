import unittest
import aoc2017.dayone.dayone as do


class TestDayOne(unittest.TestCase):

    def test_hello(self):
        self.assertEqual(do.get_hello(), "hello, barney!!")
