RUNNER ?= uv run

.DEFAULT_GOAL := lint

.PHONY: mypy ruff-format ruff-check lint run

mypy:
	$(RUNNER) mypy .

ruff-format:
	$(RUNNER) ruff format .

ruff-check:
	$(RUNNER) ruff check . --fix

lint: mypy ruff-check ruff-format

run:
	$(RUNNER) python main.py
