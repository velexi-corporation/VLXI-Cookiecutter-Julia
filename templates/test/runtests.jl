#   Copyright (c) 2022 Velexi Corporation
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

"""
Unit test runner for the {{ PKG_NAME }} package
"""

# --- Imports

# Standard library
using Test

# External packages
using ArgParse
using Documenter
#using TestSetExtensions
# TODO: replace local source file with package when pull request has been incorporated
include("../src-external/TestSetExtensions.jl")
ExtendedTestSet = TestSetExtensions.ExtendedTestSet

# ExampleModule.jl
using ExampleModule

# --- Define CLI

# Define command-line arguments
description = "Run unit tests"
arg_table = ArgParseSettings(; description=description)
@add_arg_table! arg_table begin
    "--verbose", "-v"
    help = "enable verbose mode"
    action = :store_true

    "--fail-fast", "-x"
    help = "stop testing at first failure"
    action = :store_true

    "test"
    help =
        "Julia test to run. If omitted, all Julia files in the current directory are " *
        "run as tests."
end

# Parse command-line arguments
args = parse_args(ARGS, arg_table)
verbose = args["verbose"]
fail_fast = args["fail-fast"]
test = args["test"]

# --- Preparations

# Remove options from ARGS
deleteat!(ARGS, findall(x -> x == "--verbose", ARGS))
deleteat!(ARGS, findall(x -> x == "-v", ARGS))
deleteat!(ARGS, findall(x -> x == "--fail-fast", ARGS))
deleteat!(ARGS, findall(x -> x == "-x", ARGS))

# Set `extended_test_set`
if !fail_fast
    fail_fast = get(ENV, "JULIA_TEST_FAIL_FAST", "false") == "true"
end
if fail_fast
    extended_test_set = ExtendedTestSet{Test.FallbackTestSet}
else
    extended_test_set = ExtendedTestSet
end

# Set test options
test_options = ""
if verbose
    test_options *= "verbose=true"
end

# --- Test sets

@testset "Doctests" begin
    doctest(ExampleModule)
end

@testset test_options extended_test_set "Unit tests" begin
    TestSetExtensions.@includetests ARGS
end
