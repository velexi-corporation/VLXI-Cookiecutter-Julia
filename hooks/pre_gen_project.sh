#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Apply pre-generation project configuration and setup
#------------------------------------------------------------------------------

# --- Create Julia project directory

# Set plugins parameters
if [[ "{{cookiecutter.license}}" != "None" ]]; then
    LICENSE='License(; name="{{cookiecutter.license}}"),'
else
    LICENSE=""
fi

if [[ "{{cookiecutter.tagbot_enable_gpg}}" == "yes" ]]; then
    TAG_BOT='TagBot(; gpg=Secret("GPG_KEY"), gpg_password=Secret("GPG_PASSWORD")),'
fi

# Define Julia expression to use PkgTemplates to generate a Julia project
JULIA_EXPR="
using PkgTemplates;

plugins = [
    $LICENSE
    Git(; ssh=true),
    GitHubActions(),
    Documenter{GitHubActions}(),
    $TAG_BOT
];

template=Template(;
                  julia=VersionNumber(\"{{cookiecutter.julia_version}}\"),
                  dir=\".\",
                  plugins=plugins);
template(\"{{cookiecutter.project_name}}\");
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

mv {{cookiecutter.project_name}}/* .
mv {{cookiecutter.project_name}}/.[!.]* .
rmdir {{cookiecutter.project_name}}
