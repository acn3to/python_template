# Contributing Guide

Thank you for considering contributing to the Python Project Template! This document outlines the process for contributing to the project.

## Development Environment Setup

1. Fork the repository on GitHub.
2. Clone your fork locally:
   ```bash
   git clone https://github.com/acn3to/python_template.git
   cd python_template
   ```
3. Set up the development environment using the Makefile:
   ```bash
   make setup
   ```
4. Install pre-commit hooks:
   ```bash
   make pre-commit
   ```

## Development Workflow

1. Create a branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes. Remember to:
   - Follow the code style guidelines
   - Add tests for new functionality
   - Update documentation as needed

3. Use the Makefile for all development tasks:
   ```bash
   # Format your code
   make format

   # Check for linting issues
   make lint

   # Fix linting issues
   make lint-fix

   # Run security checks
   make security

   # Run tests
   make test

   # Generate coverage report
   make coverage

   # Build and check documentation
   make docs
   make docs-serve
   ```

4. Commit your changes with a descriptive message:
   ```bash
   git commit -m "Add feature X"
   ```

5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

6. Submit a pull request to the main repository.

## Pull Request Process

1. Update the README.md and documentation with details of changes if applicable.
2. The versioning scheme used is [SemVer](http://semver.org/).
3. The PR should work for Python 3.11 or higher.
4. Ensure all tests pass and your code follows the project's style guidelines.
5. Update documentation if necessary.
6. Your PR will be reviewed by maintainers, who may request changes.

## Code Style

This project follows:
- [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide
- [Ruff](https://github.com/astral-sh/ruff) for linting and formatting
- [mypy](http://mypy-lang.org/) for type checking

All code style rules are enforced through the Makefile commands and pre-commit hooks.

## License

By contributing, you agree that your contributions will be licensed under the project's MIT License.
