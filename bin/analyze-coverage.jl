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

using Coverage
using Logging
using Printf


# --- Preparations

# Set log level
logger = SimpleLogger(stdout, Logging.Warn)
global_logger(logger)

# --- Analyze code coverage

# Process '*.cov' files
coverage = process_folder()

# Process '*.info' files
coverage = merge_coverage_counts(coverage, filter!(
    let prefixes = (joinpath(pwd(), "src", ""))
        c -> any(p -> startswith(c.filename, p), prefixes)
    end,
    LCOV.readfolder("test")))

# --- Output results

# Coverage for individual files
println(
"----------------------------------------------------------------------------")
@printf("%-40s %10s %10s %10s\n", "File", "LOC", "Missed", "Coverage")
println(
"----------------------------------------------------------------------------",
)
for file_coverage in coverage
    covered_lines, total_lines =
        get_summary(process_file(file_coverage.filename))
    @printf("%-40s %10d %10d %10.1f%%\n", file_coverage.filename,
            total_lines, total_lines - covered_lines,
            covered_lines / total_lines * 100)
end

# Coverage summary
covered_lines, total_lines = get_summary(coverage)
println(
"----------------------------------------------------------------------------")
@printf("%-40s %10d %10d %10.1f%%\n\n", "TOTAL",
        total_lines, total_lines - covered_lines,
        covered_lines / total_lines * 100)

# TODO: add count of tests passed, skipped, failed.
# TODO: add test runtime
