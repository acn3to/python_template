"""Tests for the example module."""

from python_template.example import add_numbers


def test_add_numbers() -> None:
    """Test the add_numbers function."""
    assert add_numbers(1, 2) == 3
    assert add_numbers(-1, 1) == 0
    assert add_numbers(0, 0) == 0
