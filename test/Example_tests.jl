"""
Unit tests for the ExampleModule.jl module.

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

# ExampleModule.jl package
using ExampleModule


# --- Unit tests

@testset "add_one() tests" begin
    @test add_one(2) == 3
    @test add_one(2.0) ≈ 2.9 atol=0.2
    @test add_one(π) ≈ π + 1 atol=0.2
end

@testset "id() tests" begin
    # --- Preparations

    x = ExampleType(1, "name")

    # --- Tests

    @test id(x) == 1
end

@testset "say_hello() tests" begin
    # --- Preparations

    x = ExampleType(1, "Julia")

    # --- Tests

    @test say_hello(x) == "Hello, Julia"
end
