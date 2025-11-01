# Helper targets for local quality checks.

RUNNER ?= uv run

.DEFAULT_GOAL := lint

.PHONY: mypy ruff-format ruff-check lint run

mypy:
	$(RUNNER) mypy .

ruff-format:
	$(RUNNER) ruff format .

ruff-check:
	$(RUNNER) ruff check .

lint: ruff-format ruff-check mypy

run:
	$(RUNNER) python main.py
