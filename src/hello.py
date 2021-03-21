#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Module documentation goes here."""

from __future__ import print_function

__author__ = "First Last"
__copyright__ = "Copyright 2018, First Last"
__credits__ = ["C D", "A B"]
__license__ = "Apache 2.0"
__version__ = "1.0.1"
__maintainer__ = "First Last"
__email__ = "test@example.org"
__status__ = "Development"

import argparse
from logzero import logger


def log(function):
    """Handy logging decorator."""
    def inner(*args, **kwargs):
        """Innter method."""
        logger.debug(function)
        function(*args, **kwargs)
    return inner


class Greeter():
    """Example function with types documented in the docstring."""

    def __init__(self):
        self.message = 'Hello world!'

    def set_message(self, message: str):
        """Function description."""
        self.message = message

    @log
    def print_message(self):
        """Function description."""
        print(self.message)


def main(args: argparse.Namespace):
    """ Main entry point of the app """
    Greeter().print_message()
    logger.info(args)


if __name__ == "__main__":
    PARSER = argparse.ArgumentParser()

    # Required positional argument
    PARSER.add_argument("arg", help="Required positional argument")

    # Optional argument flag which defaults to False
    PARSER.add_argument("-f", "--flag", action="store_true", default=False)

    # Optional argument which requires a parameter (eg. -d test)
    PARSER.add_argument("-n", "--name", action="store", dest="name")

    # Optional verbosity counter (eg. -v, -vv, -vvv, etc.)
    PARSER.add_argument(
        "-v",
        "--verbose",
        action="count",
        default=0,
        help="Verbosity (-v, -vv, etc)")

    # Specify output of "--version"
    PARSER.add_argument(
        "--version",
        action="version",
        version="%(prog)s (version {version})".format(version=__version__))

    MYARGS = PARSER.parse_args()
    main(MYARGS)
