"""
Unit tests for XYZ package.

------------------------------------------------------------------------------
COPYRIGHT/LICENSE. This file is part of the XYZ package. It is subject to
the license terms in the LICENSE file found in the top-level directory of
this distribution. No part of the XYZ package, including this file, may be
copied, modified, propagated, or distributed except according to the terms
contained in the LICENSE file.
------------------------------------------------------------------------------
"""
# --- Imports

# External packages
using Documenter
using Test
using TestSetExtensions

# ExampleModule.jl
using ExampleModule

# --- Test sets

@testset ExtendedTestSet "All the tests" begin
    @testset "Doctests" begin
        doctest(ExampleModule)
    end

    @testset "Unit tests" begin
        @includetests ARGS
    end
end
