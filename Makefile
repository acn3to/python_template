# Auto-create .env from example if missing
ifeq (,$(wildcard .env))
	$(warning .env file is missing. Creating from .env.example)
	@cp .env.example .env
endif
-include .env

.PHONY: setup setup-uv setup-venv install test format lint docs docker clean help

# Core variables
CHECK_DIRS := src tests
VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
HAS_UV := $(shell command -v uv 2> /dev/null)

# Tools paths
PYTEST := $(VENV)/bin/pytest
RUFF := $(VENV)/bin/ruff
MYPY := $(VENV)/bin/mypy
BANDIT := $(VENV)/bin/bandit
PRECOMMIT := $(VENV)/bin/pre-commit
MKDOCS := $(VENV)/bin/mkdocs

# Setup
setup:
ifdef HAS_UV
	@echo "Setting up using uv..."
	$(MAKE) setup-uv
else
	@echo "Setting up using venv..."
	$(MAKE) setup-venv
endif

setup-uv:
	uv venv
	. $(VENV)/bin/activate && uv pip install -e .
	. $(VENV)/bin/activate && uv pip install pytest pytest-cov ruff mypy pre-commit bandit safety hypothesis tox mkdocs mkdocs-material

setup-venv:
	python -m venv $(VENV)
	$(PIP) install -e .
	$(PIP) install pytest pytest-cov ruff mypy pre-commit bandit safety hypothesis tox mkdocs mkdocs-material

install:
ifdef HAS_UV
	@echo "Development dependencies already installed by setup-uv"
else
	@echo "Development dependencies already installed by setup-venv"
endif

# Code quality
format:
	$(RUFF) format $(CHECK_DIRS)
	$(RUFF) check --fix $(CHECK_DIRS)

format-check:
	$(RUFF) format --check $(CHECK_DIRS)
	$(RUFF) check -e $(CHECK_DIRS)

lint:
	$(RUFF) check $(CHECK_DIRS)
	$(MYPY) $(CHECK_DIRS)

lint-fix:
	$(RUFF) check --fix $(CHECK_DIRS)

security:
	$(BANDIT) -r src
	@echo "\nSafety scan requires registration. Run this separately if needed:"
	@echo "$(VENV)/bin/safety scan"

# Testing
test:
	$(PYTEST)

coverage:
	$(PYTEST) --cov=src --cov-report=xml --cov-report=term
	$(MAKE) badges

# Badges generation
badges:
	@echo "Generating badges..."
	@mkdir -p .github/badges
	@if [ -f coverage.xml ]; then \
		COVERAGE=$$(python -c 'import xml.etree.ElementTree as ET; print(round(float(ET.parse("coverage.xml").getroot().get("line-rate")) * 100))'); \
		COLOR=""; \
		if [ $$COVERAGE -ge 90 ]; then \
			COLOR="brightgreen"; \
		elif [ $$COVERAGE -ge 80 ]; then \
			COLOR="green"; \
		elif [ $$COVERAGE -ge 70 ]; then \
			COLOR="yellowgreen"; \
		elif [ $$COVERAGE -ge 60 ]; then \
			COLOR="yellow"; \
		elif [ $$COVERAGE -ge 50 ]; then \
			COLOR="orange"; \
		else \
			COLOR="red"; \
		fi; \
		echo "![Coverage](https://img.shields.io/badge/coverage-$$COVERAGE%25-$$COLOR)" > .github/badges/coverage.md; \
	else \
		echo "![Coverage](https://img.shields.io/badge/coverage-0%25-red)" > .github/badges/coverage.md; \
	fi
	@VERSION=$$(grep -m 1 'version = ' pyproject.toml | cut -d'"' -f2); \
	echo "![Version](https://img.shields.io/badge/version-$$VERSION-blue)" > .github/badges/version.md
	@echo "![Python Version](https://img.shields.io/badge/python-3.11%2B-blue)" > .github/badges/python.md
	@echo "![License](https://img.shields.io/badge/license-MIT-green)" > .github/badges/license.md
	@echo "![Linting: ruff](https://img.shields.io/badge/linting-ruff-red)" > .github/badges/ruff.md
	@echo "![Package: poetry](https://img.shields.io/badge/package-poetry-blue)" > .github/badges/poetry.md
	@echo "![Tests: pytest](https://img.shields.io/badge/tests-pytest-0A9EDC)" > .github/badges/pytest.md
	@python -c 'import re; \
		content = open("README.md").read(); \
		badges = [open(f).read().strip() for f in [ \
			".github/badges/version.md", \
			".github/badges/python.md", \
			".github/badges/poetry.md", \
			".github/badges/pytest.md", \
			".github/badges/coverage.md", \
			".github/badges/license.md", \
			".github/badges/ruff.md" \
		]]; \
		new_badges_section = "<!--BADGES-->\n<!--Don'\''t edit this section manually, use `make badges` command instead-->\n" + "\n".join(badges) + "\n<!--END_BADGES-->"; \
		new_content = re.sub(r"<!--BADGES-->.*?<!--END_BADGES-->", new_badges_section, content, flags=re.DOTALL); \
		open("README.md", "w").write(new_content)'

# Documentation
docs:
	cd docs && ../$(MKDOCS) build

docs-serve:
	cd docs && ../$(MKDOCS) serve -a localhost:8001

# Git hooks
pre-commit:
	$(PRECOMMIT) install

pre-commit-run:
	$(PRECOMMIT) run --all-files

# Docker
docker-build:
	docker build -t python_template .

docker-run:
	docker run python_template

docker-compose-up:
	docker compose up -d

docker-compose-down:
	docker compose down

docker-compose-logs:
	docker compose logs -f

# Cleanup
clean:
	rm -rf .pytest_cache .coverage htmlcov .mypy_cache .ruff_cache site/ .hypothesis
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +

# Help target
help:
	@echo "Python Project Template Commands:"
	@echo "  setup            - Set up environment (auto-detect uv or venv)"
	@echo "  install          - Install development dependencies"
	@echo "  format           - Format code with ruff"
	@echo "  format-check     - Check code formatting"
	@echo "  lint             - Run linters (ruff, mypy)"
	@echo "  lint-fix         - Fix linting issues"
	@echo "  security         - Run security checks (bandit, safety)"
	@echo "  test             - Run tests"
	@echo "  coverage         - Generate coverage report and badges"
	@echo "  docs             - Build documentation"
	@echo "  docs-serve       - Serve documentation locally"
	@echo "  pre-commit       - Install pre-commit hooks"
	@echo "  docker-build     - Build Docker image"
	@echo "  docker-run       - Run Docker container"
	@echo "  docker-compose-up - Start services with Docker Compose"
	@echo "  docker-compose-down - Stop Docker Compose services"
	@echo "  clean            - Clean generated artifacts"
