SRC_CORE=src
SRC_TEST=tests
SRC_RESOURCES=resources
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
	@echo " * css-lint     - Check CSS styke lints (csslint)."
	@echo " * js-lint      - Check JS code lints (jslint)."
	@echo " * html-lint    - Check HTML file lints (tidy)."
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
	@$(PYDOC) src

clean:
	@rm -f $(SRC_CORE)/*.pyc
	@rm -rf $(SRC_CORE)/__pycache__
	@rm -f $(SRC_TEST)/*.pyc
	@rm -rf $(SRC_TEST)/__pycache__

auto-style:
	@if type autopep8 >/dev/null 2>&1 ; then autopep8 -i -r $(SRC_CORE) ; \
	 else echo "SKIPPED. Run '$(PIP) install autopep8' first." >&2 ; fi

code-style:
	@if type pycodestyle >/dev/null 2>&1 ; then pycodestyle --max-line-length=80 $(SRC_CORE) ; \
	 else echo "SKIPPED. Run '$(PIP) install pycodestyle' first." >&2 ; fi

code-count:
	@if type cloc >/dev/null 2>&1 ; then cloc $(SRC_CORE) ; \
	 else echo "SKIPPED. Run 'brew install cloc' first." >&2 ; fi

code-lint:
	@if type pyflakes >/dev/null 2>&1 ; then pyflakes $(SRC_CORE) ; \
	 else echo "SKIPPED. Run '$(PIP) install pyflakes' first." >&2 ; fi
	@if type pylint >/dev/null 2>&1 ; then pylint $(SRC_CORE) ; \
	 else echo "SKIPPED. Run '$(PIP) install pylint' first." >&2 ; fi
	@if type flake8 >/dev/null 2>&1 ; then flake8 --max-complexity 10 $(SRC_CORE) ; \
	 else echo "SKIPPED. Run '$(PIP) install flake8' first." >&2 ; fi
	@if type pyright >/dev/null 2>&1 ; then pyright $(SRC_CORE) ; \
	 else echo "SKIPPED. Run 'npm install -f pyright' first." >&2 ; fi
	@if type mypy >/dev/null 2>&1 ; then mypy --ignore-missing-imports $(SRC_CORE) ; \
	 else echo "SKIPPED. Run '$(PIP) install mypy' first." >&2 ; fi

css-lint:
	@if type csslint >/dev/null 2>&1 ; then csslint --format=compact $(SRC_RESOURCES)/*.css ; \
	 else echo "SKIPPED. Run 'npm install -g csslint' first." >&2 ; fi

js-lint:
	@if type jslint >/dev/null 2>&1 ; then jslint $(SRC_RESOURCES)/*.js ; \
	 else echo "SKIPPED. Run 'npm install -g jslint' first." >&2 ; fi

html-lint:
	@if type tidy >/dev/null 2>&1 ; then tidy -qe $(SRC_RESOURCES)/*.html ; \
	 else echo "SKIPPED. Run 'brew install tidy' first." >&2 ; fi

lint: code-style code-lint css-lint js-lint html-lint

deps-update:
	@if type pur >/dev/null 2>&1 ; then pur -r requirements.txt ; \
	 else echo "SKIPPED. Run '$(PIP) install pur' first." >&2 ; fi

deps-install:
	@type $(PIP) >/dev/null 2>&1 || (echo "Run 'curl https://bootstrap.pypa.io/get-pip.py|sudo python3' first." >&2 ; exit 1)
	@$(PIP) install -r requirements.txt

deps-create:
	@if type pipreqs >/dev/null 2>&1 ; then pipreqs --use-local --force . ; \
	 else echo "SKIPPED. Run '$(PIP) install pipreqs' first." >&2 ; fi

feedback:
	@open https://github.com/AlexanderWillner/python-boilerplate/issues
