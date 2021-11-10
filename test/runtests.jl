"""
Unit test runner for the {{ PKG_NAME }} package

-------------------------------------------------------------------------------------------
COPYRIGHT/LICENSE. This file is part of the {{ PKG_NAME }} package. It is subject to the
license terms in the LICENSE file found in the root directory of this distribution. No
part of the {{ PKG_NAME }} package, including this file, may be copied, modified,
propagated, or distributed except according to the terms contained in the LICENSE file.
-------------------------------------------------------------------------------------------
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
