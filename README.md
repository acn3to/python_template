# Python Project Template

<!--BADGES-->
<!--Don't edit this section manually, use `make badges` command instead-->
![Version](https://img.shields.io/badge/version-0.1.0-blue)
![Python Version](https://img.shields.io/badge/python-3.11%2B-blue)
![Package: poetry](https://img.shields.io/badge/package-poetry-blue)
![Tests: pytest](https://img.shields.io/badge/tests-pytest-0A9EDC)
![Coverage](https://img.shields.io/badge/coverage-88%25-green)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
![Linting: ruff](https://img.shields.io/badge/linting-ruff-red)
<!--END_BADGES-->

Template for Python projects following development best practices.

## Features

This template includes:

- **Dependency Management**: Poetry or uv
- **Formatting and Linting**: Ruff
- **Type Checking**: mypy
- **Testing**: pytest, coverage.py, Hypothesis
- **Git Hooks**: pre-commit
- **Security**: Bandit, Safety
- **Documentation**: MkDocs
- **Containerization**: Docker

## Getting Started

### Prerequisites

- Python 3.11+
- [Poetry](https://python-poetry.org/docs/#installation) or [uv](https://github.com/astral-sh/uv)
- [Make](https://www.gnu.org/software/make/) (optional)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/acn3to/python_template.git
cd python_template
```

2. Install dependencies with Poetry:

```bash
poetry install
```

Or with uv:

```bash
uv venv
source .venv/bin/activate
uv pip install -e .
make install  # Installs all development dependencies
```

Or with standard Python venv:

```bash
make setup-venv
```

3. Configure pre-commit hooks:

```bash
make pre-commit
```

4. Update pip to the latest version (recommended for security):

```bash
.venv/bin/pip install --upgrade pip
```

## Usage

### Common Commands

The project includes a Makefile to facilitate common tasks:

```bash
# Setup environment (auto-detects if uv is available)
make setup

# Setup with virtual environment (venv)
make setup-venv

# Setup with uv
make setup-uv

# Install dependencies
make install

# Run tests
make test

# Generate coverage report and badges
make coverage

# Update all README badges
make badges

# Format code
make format

# Check formatting
make format-check

# Check linting
make lint

# Fix linting issues
make lint-fix

# Check security
make security

# Generate documentation
make docs

# Serve documentation locally
make docs-serve  # Serves on port 8001

# Install pre-commit hooks
make pre-commit

# Run pre-commit checks
make pre-commit-run

# Build Docker image
make docker-build

# Run Docker container
make docker-run

# Clean temporary files
make clean

# Display help information
make help
```

### Security Considerations

This template includes security scanning with:

- **Bandit**: For detecting common security issues in Python code
- **Safety**: For checking dependencies against known vulnerabilities

To run security checks:

```bash
make security
```

The default `make security` command will run Bandit security checks. Safety scan requires registration, and the command to run it separately will be displayed.

To run Safety scan after registering:

```bash
.venv/bin/safety scan
```

Address any vulnerabilities detected by updating dependencies or modifying vulnerable code.

### Docker

To run the project in a Docker container:

```bash
# Build the image
docker build -t python_template .

# Run the container
docker run python_template
```

## Directory Structure

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
├── pyproject.toml     # Poetry and tools configuration
├── .pre-commit-config.yaml # Pre-commit hooks
├── .gitignore         # Git ignore patterns
├── .env.example       # Environment variables example
├── .python-version    # Python version specification
├── docker-compose.yml # Docker compose configuration
├── tox.ini            # Tox configuration for multi-environment testing
├── requirements.in    # Input file for pip-tools requirements generation
└── README.md          # This file
```

## Customization

1. Replace "python_template" with your project name in all files
2. Update authors and description in `pyproject.toml`
3. Modify the badges in the README to point to your repository
4. Update `.gitignore` if you need to ignore additional files

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
