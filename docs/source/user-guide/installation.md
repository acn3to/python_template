---
title: Installation
description: How to install and set up the Python Template
tags:
  - setup
  - installation
---

# Installation

This guide will help you set up the Python project template on your system. The project uses a comprehensive Makefile that centralizes all common tasks.

## Prerequisites

Before you begin, ensure you have the following installed:

- :fontawesome-brands-python: Python 3.11+
- :material-hammer-wrench: [Make](https://www.gnu.org/software/make/) - primary tool for all operations
- :material-package-variant-closed: Either [Poetry](https://python-poetry.org/docs/#installation) or [uv](https://github.com/astral-sh/uv) (the Makefile will auto-detect which one is available)
- :material-docker: [Docker](https://docs.docker.com/get-docker/) (optional, for containerization)
- :octicons-container-16: [Docker Compose](https://docs.docker.com/compose/install/) (optional, for multi-container setup)

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/acn3to/python_template.git
cd python_template
```

### 2. Set Up the Development Environment

!!! tip "Auto-Detection"
    The Makefile will automatically detect if you have uv or use a standard virtual environment.

=== "Automatic Setup"

    ```bash
    make setup
    ```

    This single command handles:

    - Creating a virtual environment
    - Installing the package in development mode
    - Installing all development dependencies

=== "Setup with uv"

    ```bash
    make setup-uv
    ```

=== "Setup with venv"

    ```bash
    make setup-venv
    ```

### 3. Set Up Pre-commit Hooks

```bash
make pre-commit
```

Pre-commit hooks help maintain code quality by running checks before each commit.

### 4. Verify Installation

Run the tests to ensure everything is set up correctly:

```bash
make test
```

You should see all tests passing:

```text
============================= test session starts ==============================
...
collected 6 items

tests/test_example.py .                                                  [ 16%]
tests/test_main.py .....                                                 [100%]

============================== 6 passed in 0.01s ==============================
```

## Working with Docker

If you prefer to use Docker, the template provides commands to build and run containers:

=== "Docker"

    ```bash
    # Build the Docker image
    make docker-build

    # Run the container
    make docker-run
    ```

=== "Docker Compose"

    ```bash
    # Start all services
    make docker-compose-up

    # View logs
    make docker-compose-logs

    # Stop all services
    make docker-compose-down
    ```

## Troubleshooting

!!! warning "Common Issues"

    === "Poetry Not Found"

        If you see an error about Poetry not being found, install it using:

        ```bash
        curl -sSL https://install.python-poetry.org | python3 -
        ```

    === "Python Version Mismatch"

        The template requires Python 3.11+. Check your version with:

        ```bash
        python --version
        ```

## Next Steps

Proceed to the [Usage Guide](usage.md) to learn how to use the project template and the Makefile commands.
