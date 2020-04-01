SRC_CORE=src
SRC_TEST=tests
PYTHON=python3
PYDOC=pydoc3
PIP=pip3

help:
	@echo "Some available commands:"
	@echo " * run          - Run code."
	@echo " * test         - Run unit tests and test coverage."
	@echo " * doc          - Document code (pydoc)."
	@echo " * clean        - Cleanup (e.g. pyc files)."
	@echo " * auto-style   - Automatially style code (autopep8)."
	@echo " * code-style   - Check code style (pycodestyle)."
	@echo " * code-lint    - Check code lints (pyflakes, pyline, flake8)."
	@echo " * code-count   - Count code lines (cloc)."
	@echo " * deps-install - Install dependencies (see requirements.txt)."
	@echo " * deps-update  - Update dependencies (pur)."
	@echo " * deps-create  - Create dependencies (pipreqs)."
	@echo " * feedback     - Create a GitHub issue."

run:
	@$(PYTHON) $(SRC_CORE)/hello.py -f -n Foo test

test:
	@type coverage >/dev/null 2>&1 || (echo "Run '$(PIP) install coverage' first." >&2 ; exit 1)
	@coverage run --source . -m $(SRC_TEST).test_hello
	@coverage report

doc:
	@$(PYDOC) src.hello

clean:
	@rm -f $(SRC_CORE)/*.pyc
	@rm -rf $(SRC_CORE)/__pycache__
	@rm -f $(SRC_TEST)/*.pyc
	@rm -rf $(SRC_TEST)/__pycache__

auto-style:
	@type autopep8 >/dev/null 2>&1 || (echo "Run '$(PIP) install autopep8' first." >&2 ; exit 1)
	@autopep8 -i -r $(SRC_CORE)

code-style:
	@type pycodestyle >/dev/null 2>&1 || (echo "Run '$(PIP) install pycodestyle' first." >&2 ; exit 1)
	@pycodestyle --max-line-length=80 $(SRC_CORE)

code-lint:
	@type pyflakes >/dev/null 2>&1 || (echo "Run '$(PIP) install pyflakes' first." >&2 ; exit 1)
	@type pylint >/dev/null 2>&1 || (echo "Run '$(PIP) install pylint' first." >&2 ; exit 1)
	@type flake8 >/dev/null 2>&1 || (echo "Run '$(PIP) install flake8' first." >&2 ; exit 1)
	@pyflakes $(SRC_CORE)
	@pylint $(SRC_CORE)
	@flake8 --max-complexity 10 $(SRC_CORE)

code-count:
	@type cloc >/dev/null 2>&1 || (echo "Run 'brew install cloc' first." >&2 ; exit 1)
	@cloc $(SRC_CORE)

deps-update:
	@type pur >/dev/null 2>&1 || (echo "Run '$(PIP) install pur' first." >&2 ; exit 1)
	@pur -r requirements.txt

deps-install:
	@type $(PIP) >/dev/null 2>&1 || (echo "Run 'curl https://bootstrap.pypa.io/get-pip.py|sudo python3' first." >&2 ; exit 1)
	@$(PIP) install -r requirements.txt

deps-create:
	@type pipreqs >/dev/null 2>&1 || (echo "Run '$(PIP) install pipreqs' first." >&2 ; exit 1)
	@pipreqs --use-local --force .

feedback:
	@open https://github.com/AlexanderWillner/python-boilerplate/issues
