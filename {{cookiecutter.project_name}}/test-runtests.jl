"""
Unit tests for {{ cookiecutter.project_name }} package.
"""

# --- Imports

# Standard library
using Test

# External packages
using TestTools: jltest

# {{ cookiecutter.project_name }}
using {{ cookiecutter.project_name }}

# --- Run tests

jltest.run_tests(@__DIR__)
