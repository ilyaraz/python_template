RUNNER ?= uv run

.DEFAULT_GOAL := lint

.PHONY: mypy ruff-format ruff-format-ci ruff-check ruff-check-ci lint lint-ci run

mypy:
	$(RUNNER) mypy .

ruff-format:
	$(RUNNER) ruff format .

ruff-format-ci:
	$(RUNNER) ruff format --check .

ruff-check:
	$(RUNNER) ruff check . --fix

ruff-check-ci:
	$(RUNNER) ruff check .

lint: ruff-check ruff-format mypy

lint-ci: ruff-check-ci ruff-format-ci mypy

run:
	$(RUNNER) python main.py
