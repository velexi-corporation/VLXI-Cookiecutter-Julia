using {{ package_name }}
using Documenter

DocMeta.setdocmeta!(
    {{ package_name }},
    :DocTestSetup,
    :(using {{ package_name }});
    recursive=true,
)

makedocs(;
    modules=[{{ package_name }}],
    authors="Kevin Chu <kevin@velexi.com> and contributors",
    sitename="{{ package_name }}.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="{{ github.io url}}/stable",
        repolink="{{ github repo url }}",
        edit_link="main",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/{{ owner }}/{{ package_name }}.jl", devbranch="main")
