# Python 3 Boiler Plate

Simple Python boiler plate project. Main features:

* Main application with parameter parsing and logger (via decorator).
* Dynamic tests via unit tests and test coverage.
* Static tests via pycodestyle, pyflakes, and pyline.
* Requirements management.
* Basic make, .gitignore and other configuration files.

[![Build Status](https://github.com/alexanderwillner/python-boilerplate/workflows/Build-Test/badge.svg)](https://github.com/AlexanderWillner/python-boilerplate/actions) [![Build Status](https://travis-ci.org/AlexanderWillner/python-boilerplate.svg?branch=master)](https://travis-ci.org/AlexanderWillner/python-boilerplate) [![Coverage Status](https://coveralls.io/repos/github/AlexanderWillner/python-boilerplate/badge.svg?branch=master)](https://coveralls.io/github/AlexanderWillner/python-boilerplate?branch=master) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/AlexanderWillner/python-boilerplate/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/AlexanderWillner/python-boilerplate/?branch=master)

## Examples

```bash
$ make
Some available commands:
 * run          - Run code.
 * test         - Run unit tests and test coverage.
 * doc          - Document code (pydoc).
 * clean        - Cleanup (e.g. pyc files).
 * code-style   - Check code style (pycodestyle).
 * code-lint    - Check code lints (pyflakes, pyline).
 * code-count   - Count code lines (cloc).
 * deps-install - Install dependencies (see requirements.txt).
 * deps-update  - Update dependencies (via pur).
 * feedback     - Create a GitHub issue.
```

```bash
$ make test
[D 180728 04:10:10 hello:23] <function print_message at 0x107867aa0>
Hello world!
[I 180728 04:10:10 hello:47] []
.
----------------------------------------------------------------------
Ran 1 test in 0.001s

OK
Name                  Stmts   Miss  Cover
-----------------------------------------
src/__init__.py           0      0   100%
src/hello.py             26      0   100%
tests/__init__.py         0      0   100%
tests/test_hello.py      12      0   100%
-----------------------------------------
TOTAL                    38      0   100%
```
