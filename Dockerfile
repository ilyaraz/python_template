# syntax=docker/dockerfile:1.7
FROM python:3.13-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install uv for dependency management
RUN pip install --no-cache-dir --upgrade uv

WORKDIR /app

# Copy project metadata first to leverage Docker layer caching
COPY pyproject.toml uv.lock ./

# Synchronize only runtime dependencies into a local virtual environment
RUN uv sync --frozen --no-dev

# Copy the rest of the application source code
COPY . .

# Ensure the virtual environment binaries are preferred on PATH
ENV PATH="/app/.venv/bin:${PATH}"

# Default command runs the main entry point
CMD ["python", "main.py"]
