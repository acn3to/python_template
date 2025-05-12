FROM python:3.11-slim

WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency files first for better caching
COPY pyproject.toml poetry.lock README.md /app/

# Copy source code directory
COPY src/ /app/src/

# Install dependencies
RUN pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install --without dev && \
    pip uninstall -y poetry

# Copy the rest of the project files
COPY . .

# Install the package in editable mode
RUN pip install -e .

# Define volumes if needed
# VOLUME ["/app/data"]

# Expose port if needed
# EXPOSE 8000

# Default command
CMD ["python", "-m", "python_template.main"]

# For development, you can use:
# CMD ["pytest"]
