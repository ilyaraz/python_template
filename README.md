# test-code

Project scaffold created with [`uv`](https://docs.astral.sh/uv/) targeting Python 3.13.

## Requirements
- Python 3.13 (the repo includes a `.python-version` pin)
- `uv` 0.9+ installed and on your `PATH`

## Usage
- Create/refresh the virtual environment and install dependencies:
  ```sh
  UV_CACHE_DIR=.uv-cache uv sync
  ```
- Run the starter script:
  ```sh
  UV_CACHE_DIR=.uv-cache uv run python main.py
  ```
- Add dependencies as you go, for example:
  ```sh
  UV_CACHE_DIR=.uv-cache uv add requests
  ```

The `.uv-cache` directory is only needed when working inside sandboxed environments; you can drop the `UV_CACHE_DIR` override if your environment allows uv to use its default cache location.
