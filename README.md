Velexi Julia Project Cookiecutter
=================================

The [Velexi Julia Project Cookiecutter][github-vlxi-cookiecutter-julia] is intended to
streamline the process of setting up a Julia project that

* encourages the creation of high-quality software,

* promotes developer efficiency, and

* is distribution-ready.

### Features

* Standard Julia package structure (e.g., based on [PkgTemplates][pkg-templates])

* Automated testing and coverage reporting framework (e.g., [jltest][jl-test-tools],
  [jlcoverage][jl-test-tools])

* Integration with code quality tools (e.g., [pre-commit][pre-commit],
  [jlcodestyle][jl-test-tools])

* Continuous integration (CI) via GitHub Actions (e.g., testing,
  documentation deployment)

* References for Julia package development

* Directory-based development environment isolation with [direnv][direnv]

--------------------------------------------------------------------------------------------

Table of Contents
-----------------

1. [Usage][#1]

   1.1. [Cookiecutter Parameters][#1.1]

   1.2. [Setting Up a New Project][#1.2]

   1.3. [Publishing Package Documentation to GitHub Pages][#1.3]

2. [Contributor Notes][#2]

   2.1. [License][#2.1]

   2.2. [Repository Contents][#2.2]

   2.3. [Software Requirements][#2.3]

   2.4. [Setting Up to Develop the Cookiecutter][#2.4]

   2.5. [Additional Notes][#2.5]

3. [Documentation][#3]

--------------------------------------------------------------------------------------------

## 1. Usage

### 1.1. Cookiecutter Parameters

* `project_name`: project name

* `author`: project's primary author

* `email`: primary author's email

* `license`: type of license to use for the project

* `julia_version`: Julia versions compatible with the project. See the
  "[Version specifier format][julia-version-specifier-format]" section of the
  official Julia documentation for version specifier semantics.

* `github_repo_owner`: owner of the GitHub repository for the project

* `enable_github_pages`: flag indicating whether GitHub Pages should be enabled
  for the project

* `ci_include_x86`: flag indicating whether the CI testing matrix should
  include the x86 architecture

* `ci_include_codecov`: flag indicating whether the CI workflow should upload
  coverage statistics to [Codecov][codecov]

* `tagbot_use_gpg_signing`: flag indicating whether TagBot should sign the tags
  it creates

### 1.2. Setting Up a New Project

1. ___Prerequisites___

   * Install [Git][git].

   * Install [Julia][julia] 1.7 (or greater).

   * Install [Python][python] 3.8 (or greater).

     __Note__. Python is only required for a few purposes:

     * by [Cookiecutter][cookiecutter] at setup time and

     * by the Git [pre-commit][pre-commit] hooks during development.

   * Install [Poetry][poetry] 1.2 (or greater).

   * Install the [Cookiecutter][cookiecutter] Python package.

   * Install the [TestTools][jl-test-tools] Julia package.

   * _Optional_. Install [direnv][direnv].

2. Use `cookiecutter` to create a new Julia project.

   ```shell
   $ cookiecutter https://github.com/velexi-research/VLXI-Cookiecutter-Julia.git
   ```

3. Set up the Python development tools for the project.

   * Set up a dedicated virtual environment for the project. Any of the common
     virtual environment options (e.g., `venv`, `direnv`, `conda`) should work.
     Below are instructions for setting up a `direnv` or `poetry` environment.

     __Note__: to avoid conflicts between virtual environments, only one method
     should be used to manage the virtual environment.

     * __`direnv` Environment__. __Note__: `direnv` manages the environment for
       both Python and the shell.

       * ___Prerequisite___. Install `direnv`.

       * Copy `extras/dot-envrc` to the project root directory, and rename it
         to `.envrc`.

         ```shell
         $ cd $PROJECT_ROOT_DIR
         $ cp extras/dot-envrc .envrc
         ```

       * Grant permission to direnv to execute the .envrc file.

         ```shell
         $ direnv allow
         ```

     * __`poetry` Environment__. __Note__: `poetry` only manages the Python
       environment (it does not manage the shell environment).

       * Create a `poetry` environment that uses a specific Python executable.
         For instance, if `python3` is on your `PATH`, the following command
         creates (or activates if it already exists) a Python virtual
         environment that uses `python3` for the project.

         ```shell
         $ poetry env use python3
         ```

         For commands to use other Python executables for the virtual
         environment, see the [Poetry Quick Reference][poetry-quick-reference].

   * Install the Python package dependencies for the project and update them
     to the latest available versions.

     ```shell
     $ poetry install
     $ poetry update
     ```

   * Commit the updated `poetry.lock` files to the project Git repository.

4. Configure Git.

   * Install the git pre-commit hooks.

     ```shell
     $ pre-commit install
     ```

   * _Optional_. Set up a remote Git repository (e.g., GitHub repository).

     * Create a remote Git repository.

     * Configure the remote Git repository.

       ```shell
       $ git remote add origin GIT_REMOTE
       ```

       where `GIT_REMOTE` is the URL of the remote Git repository.

     * Push the `main` branch to the remote Git repository.

       ```shell
       $ git checkout main
       $ git push -u origin main
       ```

     * If GitHub Pages are enabled for the project, push the `gh-pages` branch
       to the remote Git repository.

       ```shell
       $ git checkout gh-pages
       $ git push -u origin gh-pages
       ```

5. Finish setting up the new Julia project.

   * Verify the copyright year and owner in the copyright notice. If the
     project is licensed under Apache License 2.0, the copyright notice is
     located in the `NOTICE` file. Otherwise, the copyright notice is located
     in the `LICENSE` file.

   * Verify the URLs in `docs/make.jl`, the Julia documentation build script.

     * `makedocs()`: check the leading part of the URL for the `repo` argument.
       __Note__: the URL should contain the protocol (e.g., `https://`).

       __Example__: `https://github.com/user/Project.jl/blob/{commit}{path}#{line}`

     * `Documenter.HTML()`: check the URL for the `canonical` argument.
       __Note__: the URL should contain the protocol (e.g., `https://`).

       __Example__: `https://user.github.io/Project.jl`

     * `deploydocs()`: check the URL for the `repo` argument. __Note__: the
       URL should ___not___ contain the protocol (e.g., `https://`).

       __Example__: `github.com/user/Project.jl`

   * Customize the `README.md` file to reflect the specifics of the project.

   * Commit all updated files (e.g., `poetry.lock`) to the project Git
     repository.

6. Add GitHub keys that are required for GitHub Actions workflows.

   __Documentation Deployment__

   1. Use the Julia `DocumenterTools` package to generate a key pair (with
      private key Base64-encoded).

      ```julia
      julia> using DocumenterTools
      julia> DocumenterTools.genkeys()
      ```

   2. Add the public key as a GitHub Deploy key.

      From the project GitHub repository, navigate to "Settings" > "Deploy keys"
      (in the "Security" section of the side menu).

      Add a deploy key named `Julia Documenter`.

   3. Add the private key as a GitHub Secret.

      From the project GitHub repository, navigate to "Settings" > "Secrets"
      (in the "Security" section of the side menu).

      Add a repository secret named `DOCUMENTER_KEY`.

   __Codecov Token__

   These steps are needed only if the CI workflow includes uploading of
   coverage statistics to Codecov (i.e., `ci_include_codecov` set to `yes`
   when creating the project).

   1. Log into [Codecov][codecov] and enable the project GitHub repository on
      Codecov.

   2. Get the Codecov token for the repository by navigating to "Settings"
      from the project Codecov repo page.

   3. From the project GitHub repository, navigate to "Settings" > "Secrets"
      (in the "Security" section of the side menu).

   4. Add a repository secret named `CODECOV_TOKEN`.

   __GPG Signing__

   These steps are needed only if TagBot is configured to use GPG signing
   (i.e., `tagbot_use_gpg_signing` set to `yes` when creating the project).

   1. Generate and export a GPG key pair.

      ```shell
      $ # Generate GPG key
      $ gpg --full-generate-key

      $ # Export public key in ASCII armor format (Base64-encoded)
      $ gpg --armor --export KEY_ID

      $ # Export private key in ASCII armor format (Base64-encoded)
      $ gpg --armor --export-secret-keys KEY_ID
      ```

   2. From the project GitHub repository, navigate to "Settings" > "Secrets"
      (in the "Security" section of the side menu).

   3. Add repository secrets with the following names.

      * `GPG_KEY`: public key
      * `GPG_PASSWORD`: private key

7. ___Recommended___. Customize the settings for the project GitHub repository.

   __Code Stability__. Branch protection helps ensure that there is always a
   relatively stable code branch.

   1. From the project GitHub repository, navigate to "Settings" > "Branches"
      (in the "Code and automation" section of the side menu).

   2. Set the default branch to `main`.

   3. Add branch protection for the `main` branch and enable the following
      configurations.

      * Require a pull request before merging

        * Require approvals

          * __Recommendation__: enable for projects with multiple active
            developers who can serve as reviewers

          * __Warning__: must be disabled for projects with a single developer

      * Require conversation resolution before merging

      * Do not allow bypassing the above settings

   __GitHub Actions Security__. Restricting GitHub Actions decreases the
   chances of accidental (or intentional) modifications to the code base.

   1. From the project GitHub repository, navigate to "Settings" > "Actions" >
      "General" (in the "Code and automation" section of the side menu).

   2. Configure "Actions permissions".

      * Select the most restrictive option and customize the sub-options.

        * Allow actions created by GitHub: yes

        * Allow actions by Marketplace verified creators: no

        * Allow specified actions and reusable workflows.

          ```
          JuliaRegistries/TagBot@,
          codecov/codecov-action@*,
          julia-actions/*,
          ```

   3. Configure "Workflow permissions".

      * Select "Read repository content permissions".

      * Allow GitHub Actions to create and approve pull requests: no

### 1.3. Publishing Package Documentation to GitHub Pages

1. From the project GitHub repository, navigate to "Settings" > "Pages" (in
   the "Code and automation" section of the side menu) and configure GitHub
   Pages to use "GitHub Actions" as its "Source".

   * Source: GitHub Actions

2. In the "About" section of the project GitHub repository, set "Website" to
   the URL for the project GitHub Pages.

3. That's it! Every time the `main` branch is updated, the CI and gh-pages
   workflows will automatically update the package documentation on GitHub
   Pages.

-------------------------------------------------------------------------------

## 2. Contributor Notes

### 2.1. License

The contents of this cookiecutter are covered under the Apache License 2.0 (included in the
`LICENSE` file). The copyright for this cookiecutter is contained in the `NOTICE` file.

### 2.2. Repository Contents

```
├── README.md               <- this file
├── NEWS.md                 <- cookiecutter release notes
├── LICENSE                 <- cookiecutter license
├── NOTICE                  <- cookiecutter copyright notice
├── cookiecutter.json       <- cookiecutter configuration file
├── pyproject.toml          <- Python project metadata file for cookiecutter
│                              development
├── poetry.lock             <- Poetry lockfile
├── docs/                   <- cookiecutter documentation
├── extras/                 <- additional files that may be useful for
│                              cookiecutter development
├── hooks/                  <- cookiecutter scripts that run before and/or
│                              after project generation
├── spikes/                 <- experimental code
└── {{cookiecutter.name}}/  <- cookiecutter template
```

### 2.3. Software Requirements

#### Base Requirements

* [Git][git]
* [Julia][julia] (>=1.6)
* [Python][python] (>=3.8)
* [Poetry][poetry]

#### Optional Packages

* [direnv][direnv]

#### Python Packages

See `[tool.poetry.dependencies]` section of [`pyproject.toml`](pyproject.toml).

### 2.4. Setting Up to Develop the Cookiecutter

1. Set up a dedicated virtual environment for cookiecutter development.
   See Step 3 from [Section 2.1][#2.1] for instructions on how to set up
   `direnv` and `poetry` environments.

2. Install the Python packages required for development.

   ```shell
   $ poetry install

3. Install the git pre-commit hooks.

   ```shell
   $ pre-commit install
   ```

4. Make the cookiecutter better!

### 2.5. Additional Notes

#### Updating Cookiecutter Template Dependencies

To update the Python dependencies for the template (contained in the
`{{cookiecutter.project_name}}` directory), use the following procedure to
ensure that package dependencies for developing the non-template components
of the cookiecutter (e.g., cookiecutter hooks) do not interfere with package
dependencies for the template.

* Create a local clone of the cookiecutter Git repository to use for
  cookiecutter development.

  ```shell
  $ git clone git@github.com:velexi-research/VLXI-Cookiecutter-Julia.git
  ```

* Use `cookiecutter` from the local cookiecutter Git repository to create a
  clean project for template dependency updates.

  ```shell
  $ cookiecutter PATH/TO/LOCAL/REPO
  ```

* In the pristine project, perform the following steps to update the template's
  package dependencies.

  * Set up a virtual environment for developing the template (e.g., a direnv
    environment).

  * Use `poetry` or manually edit `pyproject.toml` to (1) make changes to the
    package dependency list and (2) update the package dependency versions.

  * Use `poetry` to update the package dependencies and versions recorded in
    the `poetry.lock` file.

* Update `{{cookiecutter.project_name}}/pyproject.toml`.

  * Copy `pyproject.toml` from the pristine project to
    `{{cookiecutter.project_name}}/pyproject.toml`.

  * Restore the templated values in the `[tool.poetry]` section to the
    following:

    <!-- {% raw %} -->
    ```jinja
    [tool.poetry]
    name = "{{ cookiecutter.project_name }}"
    version = "0.1.0"
    description = ""
    license = "{% if cookiecutter.license == 'ASL' %}Apache-2.0{% elif cookiecutter.license == 'BSD3' %}BSD-3-Clause{% elif cookiecutter.license == 'MIT' %}MIT{% endif %}"
    readme = "README.md"
    authors = ["{{ cookiecutter.author }} <{{ cookiecutter.email }}>"]
    ```
    <!-- {% endraw %} -->

* Update `{{cookiecutter.project_name}}/poetry.lock`.

  * Copy `poetry.lock` from the pristine project to
    `{{cookiecutter.project_name}}/poetry.lock`.

* Commit the updated `pyproject.toml` and `poetry.lock` files to the Git
  repository.

--------------------------------------------------------------------------------------------

## 3. Documentation

* [Julia Packaging Guide][julia-packaging-guide]

* [Poetry Quick Reference][poetry-quick-reference]

* [Velexi Julia Code Structure and Style Conventions][julia-style-conventions]

--------------------------------------------------------------------------------------------

[----------------------------------- INTERNAL LINKS -----------------------------------]: #

[#1]: #1-usage
[#1.1]: #11-cookiecutter-parameters
[#1.2]: #12-setting-up-a-new-project
[#1.3]: #13-publishing-package-documentation-to-github-pages

[#2]: #2-contributor-notes
[#2.1]: #21-license
[#2.2]: #22-repository-contents
[#2.3]: #23-software-requirements
[#2.4]: #24-setting-up-to-develop-the-cookiecutter
[#2.5]: #25-additional-notes

[#3]: #3-documentation

[---------------------------------- REPOSITORY LINKS ----------------------------------]: #

[github-vlxi-cookiecutter-julia]: https://github.com/velexi-research/VLXI-Cookiecutter-Julia

[julia-packaging-guide]: {{cookiecutter.project_name}}/extras/references/Julia-Packaging-Guide.md

[julia-style-conventions]: {{cookiecutter.project_name}}/extras/references/Velexi-Julia-Code-Structure-and-Style-Conventions.md

[poetry-quick-reference]: {{cookiecutter.project_name}}/extras/references/Poetry-Quick-Reference.md

[----------------------------------- EXTERNAL LINKS -----------------------------------]: #

[codecov]: https://codecov.io/

[cookiecutter]: https://cookiecutter.readthedocs.io/en/latest/

[direnv]: https://direnv.net/

[git]: https://git-scm.com/

[jl-test-tools]: https://velexi-corporation.github.io/TestTools.jl/

[julia]: https://julialang.org/

[julia-version-specifier-format]: https://pkgdocs.julialang.org/v1/compatibility/#Version-specifier-format

[pkg-templates]: https://invenia.github.io/PkgTemplates.jl/

[poetry]: https://python-poetry.org/

[pre-commit]: https://pre-commit.com/

[python]: https://www.python.org/
