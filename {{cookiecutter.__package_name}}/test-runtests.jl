"""
Unit tests for {{ cookiecutter.__package_name }} package.
"""

# --- Imports

# Standard library
using Test

# External packages
using TestTools: jltest

# {{ cookiecutter.__package_name }}
using {{ cookiecutter.__package_name }}

# --- Run tests

jltest.run_tests(@__DIR__)
