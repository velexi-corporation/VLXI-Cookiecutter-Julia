#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Cookiecutter pre-generation script
#------------------------------------------------------------------------------

# --- Preparations

# Get Julia package name
if [[ "{{ cookiecutter.project_name }}" == .jl* ]]; then
    echo 'Error: `project_name` cannot start with ".jl"'
    exit 1
fi
JL_PACKAGE_NAME='{{ cookiecutter.project_name | trim(".jl") | trim() | replace(" ", "_") }}'
if [ -z "$JL_PACKAGE_NAME" ]; then
    echo "Error: JL_PACKAGE_NAME cannot be empty."
    exit 1
fi

# --- Create Julia project directory

# Set plugins parameters
if [[ "{{ cookiecutter.license }}" != "None" ]]; then
    LICENSE='License(; name="{{ cookiecutter.license }}"),'
else
    LICENSE=""
fi

if [[ "{{ cookiecutter.tagbot_use_gpg_signing }}" == "yes" ]]; then
    TAG_BOT='TagBot(; gpg=Secret("GPG_KEY"), gpg_password=Secret("GPG_PASSWORD")),'
fi

# Define Julia expression to use PkgTemplates to generate a Julia project
JULIA_EXPR="
using Pkg;

Pkg.add(\"PkgTemplates\");
using PkgTemplates;

plugins = [
    $LICENSE
    Git(; ssh=true),
    GitHubActions(),
    Documenter{GitHubActions}(),
    $TAG_BOT
];

dir = \".\";
project_name = \"$JL_PACKAGE_NAME\";
template=Template(;
                  julia=VersionNumber(\"{{ cookiecutter.julia_version }}\"),
                  dir=dir,
                  plugins=plugins);
template(project_name);
Pkg.activate(joinpath(dir, project_name));
Pkg.upgrade_manifest();
"

# Display Julia expression to generate Julia project
echo
echo "Running Julia expression:"
echo
echo $JULIA_EXPR
echo

# Run Julia expression to generate Julia project
julia --startup-file=no -q --compile=min -O0 -e "${JULIA_EXPR}"

# --- Move files to cookiecutter directory

mv $JL_PACKAGE_NAME/* .
mv $JL_PACKAGE_NAME/.[!.]* .
rmdir $JL_PACKAGE_NAME
