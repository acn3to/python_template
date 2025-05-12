---
title: API Reference
description: Documentation for the Python Template API
tags:
  - api
  - reference
---

# API Reference

This page provides comprehensive documentation for the Python Template API.

## Main Module

### Source Module: `python_template.main`

The main module provides core functionality for the Python Template.

```python
# Source code import
from python_template.main import hello, process_data, main
```

### `hello(name='World')`

Returns a greeting string with the provided name.

**Parameters:**

* `name` (str): Name to personalize the greeting. Default is 'World'.

**Returns:**

* str: A greeting string in the format `"Hello, {name}!"`.

**Example:**

```python
from python_template.main import hello

# Get a default greeting
greeting = hello()  # Returns "Hello, World!"

# Get a personalized greeting
greeting = hello("Python")  # Returns "Hello, Python!"
```

### `process_data(data, filter_key=None)`

Processes a list of dictionaries, optionally filtering by a specific key.

**Parameters:**

* `data` (List[Dict[str, Any]]): List of dictionaries to process.
* `filter_key` (Optional[str]): If provided, only dictionaries containing this key are included.

**Returns:**

* List[Dict[str, Any]]: Processed list of dictionaries.

**Example:**

```python linenums="1" title="process_data_example.py"
from python_template.main import process_data

# Sample data
data = [
    {"a": 1},
    {"b": 2},
    {"a": 3, "c": 4}
]

# Process data without filtering
result = process_data(data)  # Returns a copy of the original list

# Process data with filtering
filtered = process_data(data, filter_key="a")  # Returns [{"a": 1}, {"a": 3, "c": 4}]
```

### `main()`

The main entry point for the package when run as a script.

**Returns:**

* None: Prints a greeting to the console.

**Example:**

```python
from python_template.main import main

# Run the main function
main()  # Prints "Hello, Python!" to the console
```

## Example Module

### Source Module: `python_template.example`

The example module provides utility functions for demonstration.

```python
# Source code import
from python_template.example import add_numbers
```

### `add_numbers(a, b)`

Adds two numbers together.

**Parameters:**

* `a` (int): First number.
* `b` (int): Second number.

**Returns:**

* int: Sum of a and b.

**Example:**

```python
from python_template.example import add_numbers

# Add two positive numbers
result = add_numbers(1, 2)  # Returns 3

# Add a negative and positive number
result = add_numbers(-1, 1)  # Returns 0
```

## Usage Patterns

Here are some common patterns for using the template API:

=== "Basic Usage"

    ```python
    from python_template.main import hello

    # Simple greeting
    print(hello("World"))
    ```

=== "Data Processing"

    ```python
    from python_template.main import process_data

    # Process and filter data
    data = [{"id": 1, "value": "a"}, {"id": 2, "name": "b"}]
    filtered = process_data(data, filter_key="id")
    print(filtered)
    ```

=== "Combining Features"

    ```python
    from python_template.main import hello, process_data
    from python_template.example import add_numbers

    # Use multiple API functions together
    name = "User"
    greeting = hello(name)
    print(greeting)

    numbers = [{"a": 1}, {"a": 2}, {"b": 3}]
    filtered = process_data(numbers, filter_key="a")

    total = 0
    for item in filtered:
        total = add_numbers(total, item["a"])

    print(f"Total: {total}")
    ```

## Future Extensions

This API will be expanded as the project grows. Upcoming features may include:

- Additional data processing utilities
- Configuration management
- Logging facilities
- Integration with common services

!!! note "Versioning"

    This project follows [Semantic Versioning](https://semver.org/).
    API changes will be documented in the project's changelog.

!!! tip "Contributing"

    Interested in contributing to the API? Check out our
    [Contributing Guide](dev/contributing.md).
