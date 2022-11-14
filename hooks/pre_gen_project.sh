#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Cookiecutter pre-generation script
#------------------------------------------------------------------------------

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
project_name = \"{{ cookiecutter.project_name }}\";
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

mv {{ cookiecutter.project_name }}/* .
mv {{ cookiecutter.project_name }}/.[!.]* .
rmdir {{ cookiecutter.project_name }}
