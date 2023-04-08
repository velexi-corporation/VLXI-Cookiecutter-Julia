"""
Unit tests for {{ cookiecutter.__project_name }} package.
"""

# --- Imports

# Standard library
using Test

# External packages
using TestTools: jltest

# {{ cookiecutter.__project_name }}
using {{ cookiecutter.__project_name }}

# --- Run tests

jltest.run_tests(@__DIR__)
