"""
Unit tests for Example.jl module.

------------------------------------------------------------------------------
COPYRIGHT/LICENSE. This file is part of the XYZ package. It is subject to
the license terms in the LICENSE file found in the top-level directory of
this distribution. No part of the XYZ package, including this file, may be
copied, modified, propagated, or distributed except according to the terms
contained in the LICENSE file.
------------------------------------------------------------------------------
"""
# --- Imports

# Standard library
using Test

# Example.jl package
using Example


# --- Unit tests

@testset "say_hello() tests" begin
    @test say_hello("Julia") == "Hello, Julia"
end

@testset "add_one() tests" begin
    # Unit tests for add_one()
    @test add_one(2) == 3
    @test add_one(2.0) ≈ 2.9 atol=0.2
    @test add_one(π) ≈ π + 1 atol=0.2
end
