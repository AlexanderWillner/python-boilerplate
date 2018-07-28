#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Module documentation goes here."""

import unittest
import sys
from src.hello import Greeter
from src.hello import main

class MyTestCase(unittest.TestCase):
    """Class documentation goes here."""
    def test_default_greeting_set(self):
        """Test documentation goes here."""
        INPUT="SDF"
        greeter = Greeter()
        greeter.set_message(INPUT)
        self.assertEqual(greeter.message, INPUT)
        main(sys.argv[1:])

if __name__ == '__main__':
    unittest.main()
