---
title: Python Template
description: Modern Python project template with best practices
hide:
  - navigation
---

# Python Template

<div class="grid cards" markdown>

-   :fontawesome-brands-python:{ .lg .middle } __Dependency Management__

    ---

    Manage your dependencies efficiently with Poetry or uv

    [:octicons-arrow-right-24: Read more](#features)

-   :material-format-font:{ .lg .middle } __Formatting and Linting__

    ---

    Code formatting and linting with Ruff

    [:octicons-arrow-right-24: Read more](#features)

-   :material-test-tube:{ .lg .middle } __Testing__

    ---

    Testing with pytest, coverage.py, and property-based testing with Hypothesis

    [:octicons-arrow-right-24: Read more](#features)

-   :material-docker:{ .lg .middle } __Containerization__

    ---

    Containerize your application with Docker and Docker Compose

    [:octicons-arrow-right-24: Read more](#features)

</div>

## Features

This template includes everything you need to create a professional Python package:

- **Dependency Management**: [Poetry](https://python-poetry.org/) or [uv](https://github.com/astral-sh/uv)
- **Formatting and Linting**: [Ruff](https://github.com/astral-sh/ruff)
- **Type Checking**: [mypy](https://mypy.readthedocs.io/)
- **Testing**: [pytest](https://docs.pytest.org/), [coverage.py](https://coverage.readthedocs.io/), [Hypothesis](https://hypothesis.readthedocs.io/)
- **Git Hooks**: [pre-commit](https://pre-commit.com/)
- **Security**: [Bandit](https://bandit.readthedocs.io/), [Safety](https://pyup.io/safety/)
- **Documentation**: [MkDocs](https://www.mkdocs.org/) with [Material theme](https://squidfunk.github.io/mkdocs-material/)
- **Containerization**: [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/)
- **Automation**: Comprehensive [Makefile](https://makefiletutorial.com/)

## Project Structure

The project follows a clean and intuitive structure:

```
├── .github/           # Badge storage
│   └── badges/        # Project badges
├── docs/              # Documentation
│   ├── mkdocs.yml     # MkDocs configuration
│   └── source/        # Documentation source files
│       ├── index.md   # Home page
│       ├── api.md     # API documentation
│       ├── dev/       # Development documentation
│       └── user-guide/ # User guide documentation
├── src/               # Source code
│   └── python_template/ # Main package
│       ├── __init__.py
│       ├── main.py
│       └── example.py
├── tests/             # Tests
│   ├── __init__.py
│   ├── test_example.py
│   └── test_main.py
├── Dockerfile         # Containerization
├── Makefile           # Task automation
├── pyproject.toml     # Project configuration
├── .pre-commit-config.yaml # Pre-commit hooks
├── .gitignore         # Git ignore patterns
├── .env.example       # Environment variables example
├── .python-version    # Python version specification
├── docker-compose.yml # Docker compose configuration
├── tox.ini            # Tox configuration for multi-environment testing
├── requirements.in    # Input file for pip-tools requirements generation
└── README.md          # Project overview
```

## Quick Start

=== "Poetry"

    ```bash
    # Clone the repository
    git clone https://github.com/acn3to/python_template.git
    cd python_template

    # Install dependencies
    poetry install

    # Install pre-commit hooks
    poetry run pre-commit install
    ```

=== "uv"

    ```bash
    # Clone the repository
    git clone https://github.com/acn3to/python_template.git
    cd python_template

    # Create environment and install
    uv venv
    source .venv/bin/activate
    uv pip install -e .
    make install

    # Install pre-commit hooks
    make pre-commit
    ```

=== "venv"

    ```bash
    # Clone the repository
    git clone https://github.com/acn3to/python_template.git
    cd python_template

    # Create environment and install
    make setup-venv

    # Install pre-commit hooks
    make pre-commit
    ```

## Getting Started

See the [Installation Guide](user-guide/installation.md) for detailed setup instructions and the [Usage Guide](user-guide/usage.md) for how to use this template effectively.

!!! tip "Developer's Note"

    This template is designed to follow Python best practices and make your development workflow more efficient.

!!! info "Python Version"

    This template requires Python 3.11 or higher.
