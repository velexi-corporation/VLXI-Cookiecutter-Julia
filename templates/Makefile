# --- User Parameters


# --- Internal Parameters


# --- Targets

# Default target
all: test

# Testing
test:
	@echo Removing old coverage files
	julia --color=yes --compile=min -O0 -e 'using Coverage; clean_folder(".");'
	@echo
	@echo Running tests
	julia --color=yes -e 'import Pkg; Pkg.test(coverage=true)'
	@echo
	@echo Generating code coverage report
	@jlcoverage

# Maintenance
clean:
	@echo Removing coverage files
	julia --color=yes --compile=min -O0 -e 'using Coverage; clean_folder(".");'

spotless: clean
	find . -name "Manifest.toml" -exec rm -rf {} \;  # Manifest.toml files

# Phony Targets
.PHONY: all \
		test \
		clean spotless
