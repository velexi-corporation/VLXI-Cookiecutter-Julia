#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Cookiecutter post-generation script
#------------------------------------------------------------------------------

# --- Update project template files based on user configuration

# Remove NOTICE file if license is not Apache License 2.0
if [[ "{{ cookiecutter.license }}" != "ASL" ]]; then
    rm NOTICE
fi

# Force LICENSE file to be an empty file if an empty license is selected
if [[ "{{ cookiecutter.license }}" == "None" ]]; then
    rm LICENSE
    touch LICENSE
fi

# Replace default GitHub Actions workflows
mv dot-github-workflows-CI.yml .github/workflows/CI.yml

# Add Project.toml to test directory
mv test-Project.toml test/Project.toml

# Replace test/runtests.jl
mv test-runtests.jl test/runtests.jl

# --- Set up Git repository for project

# Initialize Git repository
git init

# Commit cookiecutter files
git add .
git commit -m "Initial commit."

# Create branch for deployment of package documentation to GitHub pages
if [[ "{{ cookiecutter.enable_github_pages }}" == "yes" ]]; then

    # Create gh-pages branch
    git checkout -b gh-pages

    # Change back to "main" branch
    git checkout main
fi
