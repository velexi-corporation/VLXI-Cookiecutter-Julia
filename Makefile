# --- User Parameters


# --- Internal Parameters


# --- Targets

# Default target
all: fast-test

# Testing
full-test full-check:
	make test-cmd TEST_ARGS=String[]

fast-test fast-check test check:
	make test-cmd TEST_ARGS=[\"-x\"]

test-cmd:
	@echo Remove old coverage files
	julia --color=yes --compile=min -O0 -e 'using Coverage; clean_folder(".");'
	@echo
	@echo Run tests
	julia --color=yes -e 'import Pkg; Pkg.test(coverage=true; test_args=${TEST_ARGS})'
	@echo
	@echo Generate code coverage report
	@jlcoverage

# Maintenance
clean:
	find . -name "tmp.init-pkg.*" -exec rm -rf {} \;  # init-pkg.jl files
	@echo Remove coverage files
	julia --color=yes --compile=min -O0 -e 'using Coverage; clean_folder(".");'

spotless: clean
	find . -name "Manifest.toml" -exec rm -rf {} \;  # Manifest.toml files

# Setup Julia
setup:
	julia --project=`pwd`/bin --startup-file=no -e 'import Pkg; Pkg.instantiate()'
	julia --project=`pwd`/test --startup-file=no -e 'import Pkg; Pkg.instantiate()'

# Phony Targets
.PHONY: all clean format setup \
        test check
