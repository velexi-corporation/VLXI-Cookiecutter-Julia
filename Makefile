# --- User Parameters


# --- Internal Parameters


# --- Targets

# Default target
all: test

test check:
	find . -name "*.jl.*.cov" -exec rm -f {} \;  # Remove old coverage files
	julia --color=yes --code-coverage test/runtests.jl
	julia bin/analyze-coverage.jl

# Maintenance
clean:
	find . -name "*.jl.*.cov" -exec rm -f {} \;  # Coverage.jl files
	find . -name "*.jl.*.mem" -exec rm -f {} \;  # Coverage.jl files

# Phony Targets
.PHONY: all clean \
        test check
