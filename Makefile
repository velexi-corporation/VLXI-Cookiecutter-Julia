# --- User Parameters


# --- Internal Parameters


# --- Targets

# Default target
all: fast-test

# Testing
test-cmd:
	find . -name "*.jl.*.cov" -exec rm -f {} \;  # Remove old coverage files
	julia --color=yes -e 'import Pkg; Pkg.test(coverage=true; test_args=${TEST_ARGS})'
	@echo
	coverage.jl

full-test full-check:
	make test-cmd TEST_ARGS=String[]

fast-test fast-check test check:
	make test-cmd TEST_ARGS=[\"-x\"]

# Code style
format:
	julia -e 'using JuliaFormatter; format("."; style=BlueStyle());'

# Maintenance
clean:
	find . -name "tmp.init-pkg.*" -exec rm -rf {} \;  # init-pkg.jl files
	find . -name "*.jl.*.cov" -exec rm -f {} \;  # Coverage.jl files
	find . -name "*.jl.*.mem" -exec rm -f {} \;  # Coverage.jl files

spotless: clean
	find . -name "Manifest.toml" -exec rm -rf {} \;  # Manifest.toml files

# Setup Julia
setup:
	julia --project=`pwd`/bin --startup-file=no \
		-e 'import Pkg; Pkg.instantiate()'
	julia --project=`pwd`/test --startup-file=no \
		-e 'import Pkg; Pkg.instantiate()'

# Phony Targets
.PHONY: all clean format setup \
        test check
