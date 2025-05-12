"""Tests for the main module."""

from typing import Any, Dict, List

from hypothesis import given
from hypothesis import strategies as st
from python_template.main import hello, process_data


def test_hello() -> None:
    """Test the hello function."""
    assert hello() == "Hello, World!"

    assert hello("Python") == "Hello, Python!"

    assert hello("") == "Hello, !"


class TestProcessData:
    """Tests for the process_data function."""

    def test_empty_data(self) -> None:
        """Test behavior with empty list."""
        assert process_data([]) == []

    def test_without_filter(self) -> None:
        """Test processing without filter."""
        data = [{"a": 1}, {"b": 2}]

        result = process_data(data)

        assert result == data

        assert result is not data

    def test_with_filter(self) -> None:
        """Test processing with filter."""
        data = [{"a": 1}, {"b": 2}, {"a": 3, "c": 4}]

        result = process_data(data, filter_key="a")

        assert result == [{"a": 1}, {"a": 3, "c": 4}]

    @given(
        st.lists(st.dictionaries(st.text(), st.integers())),
        st.text() | st.none(),
    )
    def test_property_based(self, data: List[Dict[str, Any]], filter_key: str) -> None:
        """Test properties with randomly generated data."""
        assert isinstance(result := process_data(data, filter_key), list)

        if filter_key is None:
            assert len(result) == len(data)

        elif filter_key:
            assert all(filter_key in item for item in result)
