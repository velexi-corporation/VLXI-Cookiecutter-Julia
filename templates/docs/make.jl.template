# --- Setup

# Imports
using Documenter
using {{ PKG_NAME }}

# Set up DocMeta
DocMeta.setdocmeta!(
    {{ PKG_NAME }}, :DocTestSetup, :(using {{ PKG_NAME }}); recursive=true
)

# --- Generate documentation

makedocs(;
    modules=[{{ PKG_NAME }}],
    authors="{{ PKG_AUTHOR_NAME }} <{{ PKG_AUTHOR_EMAIL }}> and contributors",
    repo="https://github.com/{{ GITHUG_ACCOUNT_OWNER }}/{{ PKG_NAME }}.jl/blob/{commit}{path}#{line}",
    sitename="{{ PKG_NAME }}",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://{{ GITHUG_ACCOUNT_OWNER }}.github.io/{{ PKG_NAME }}.jl/stable",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

# --- Deploy documentation

deploydocs(;
    repo="github.com/{{ GITHUB_ACCOUNT_OWNER}}/{{ PKG_NAME }}.jl",
    devbranch="main"
)
