"""
Unit test runner for the {{ PKG_NAME }} package.

-------------------------------------------------------------------------------------------
COPYRIGHT/LICENSE. This file is part of the {{ PKG_NAME }} package. It is subject to the
license terms in the LICENSE file found in the root directory of this distribution. No
part of the {{ PKG_NAME }} package, including this file, may be copied, modified,
propagated, or distributed except according to the terms contained in the LICENSE file.
-------------------------------------------------------------------------------------------
"""
# --- Imports

# External packages
using Documenter
using Test
using TestSetExtensions

# ExampleModule.jl
using ExampleModule

# --- Preparations

#=
# Note: fail-fast requires https://github.com/ktchu/TestSetExtensions.jl
=#
ENABLE_FAIL_FAST = get(ENV, "JULIA_TEST_FAIL_FAST", "false")
if ENABLE_FAIL_FAST == "true"
    extended_test_set = ExtendedTestSet{Test.FallbackTestSet}
else
    extended_test_set = ExtendedTestSet
end

# --- Test sets

@testset "Doctests" begin
    doctest(ExampleModule)
end

@testset extended_test_set "Unit tests" begin
    @includetests ARGS
end
