#!/bin/bash
# -*- mode: julia -*-
#=
exec julia --color=yes --startup-file=no \
           --project=`dirname "${BASH_SOURCE[0]}"` "${BASH_SOURCE[0]}" "$@"
=#
"""
------------------------------------------------------------------------------
Copyright (c) 2021 Velexi Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
------------------------------------------------------------------------------
"""
# --- Imports

# Standard library
using Printf

# External packages
using ArgParse
using JuliaFormatter

# --- Main program

function main()
    # --- Preparations

    # Define command-line interface arguments
    description = "Check source code files against Julia style conventions."
    arg_table = ArgParseSettings(; description=description)
    @add_arg_table! arg_table begin
        "--overwrite", "-o"
        help = "overwrite files with reformatted source code"
        action = :store_true

        "--style", "-s"
        help = "Julia style convention to apply"
        default = "BlueStyle"

        "paths"
        help = "space-separated list of files or directories to apply style conventions to"
        nargs = '*'
    end

    # Parse command-line arguments
    args::Dict = parse_args(ARGS, arg_table)
    overwrite::Bool = args["overwrite"]
    style_str::String = lowercase(args["style"])
    paths::Vector{String} = args["paths"]

    # Set paths
    if isempty(paths)
        paths = ["."]
    end

    # Set code style
    if style_str == "defaultstyle" || style_str == "default"
        style = DefaultStyle()
    elseif style_str == "yasstyle" || style_str == "yas"
        style = YASStyle()
    else
        style = BlueStyle()
    end

    # --- Check code style

    check_passed = format(paths; style=style, overwrite=overwrite, verbose=true)
    if check_passed
        println("\nNo style errors found.")
    else
        if overwrite
            println("\nStyle errors found. Files modified to correct errors.")
        else
            println("\nStyle errors found. Files not modified.")
        end
    end

    return nothing
end

# --- Run main program

main()
