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

lint: mypy ruff-check ruff-format

lint-ci: mypy ruff-check-ci ruff-format-ci

run:
	$(RUNNER) python main.py
