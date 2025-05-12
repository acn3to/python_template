"""Main module of the package."""

from typing import Any, Dict, List, Optional


def hello(name: str = "World") -> str:
    """Return a greeting.

    Args:
        name: Name to personalize the greeting.

    Returns:
        A string with the greeting.
    """
    return f"Hello, {name}!"


def process_data(
    data: List[Dict[str, Any]], filter_key: Optional[str] = None
) -> List[Dict[str, Any]]:
    """Process a list of dictionaries.

    Args:
        data: List of dictionaries to process.
        filter_key: Optional key to filter dictionaries.

    Returns:
        List of processed dictionaries.
    """
    if not data:
        return []

    result = data.copy()

    if filter_key:
        result = [item for item in result if filter_key in item]

    return result


def main() -> None:
    """Run the main function."""
    print(hello("Python"))


if __name__ == "__main__":
    main()
