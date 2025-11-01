RUNNER ?= uv run
IMAGE_NAME ?= $(notdir $(CURDIR))
TIMESTAMP := $(shell date +%Y%m%d%H%M%S)

.DEFAULT_GOAL := lint

.PHONY: mypy ruff-format ruff-format-ci ruff-check ruff-check-ci lint lint-ci run docker-build

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

docker-build:
	docker build -t $(IMAGE_NAME):$(TIMESTAMP) -t $(IMAGE_NAME):latest .
