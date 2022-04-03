Velexi Julia Project Cookiecutter: Templates
============================================

--------------------------------------------------------------------------------------------
## Preliminaries

Template files are indicated by the `template` suffix and are intended to simplify the
set up of the project. When used, they should be renamed to remove the `template`
suffix. Template parameters are denoted by double braces with the parameter in all
capital letters (e.g. `{{ PKG_NAME }}`).

__Notes__

* GitHub Action workflow files (e.g., `CI.yml`) use the following notation for workflow
  variables: `${{ variable_name }}`. These variables should _not_ be confused with
  template parameters.

--------------------------------------------------------------------------------------------

## Git Configuration

* `templates/github`: directory containing GitHub Actions workflow files and templates

* `templates/gitignore`: sample `.gitignore` for project

  * __Note__. If used, `gitignore` should be renamed to `.gitignore` and placed in the
    project root directory.

--------------------------------------------------------------------------------------------

## Julia Code and Documentation

* `templates/docs`: directory containing Julia Documenter files and templates

* `templates/src`: directory containing a simple example of the code organization
  guidelines

  * `XYZModule.jl`: an example Julia module
  * `XYZType.jl`: an example source file for defining a type
  * `XYZMethods.jl`: an example source file for defining methods

* `templates/test`: directory containing an example of code organization for the `test`
  directory

  * `XYZ_tests.jl`: example unit tests
  * `runtests.jl`: example test setup file
  * `Project.toml`: project dependencies for running unit tests

--------------------------------------------------------------------------------------------

## Makefile

* `templates/Makefile`: sample Makefile for project

  * __Note__. If used, `Makefile` should be placed in the project root directory.

### Make Targets

* `make fast-test`. Run tests in fail-fast mode (i.e., halt testing after the first
  failing test). If the all tests pass, coverage information is displayed.

  __Note__. `fast-test` is the default Make target, so `make` will produce the same result.

* `make test`. Run all tests and display coverage information.

* `make codestyle`. Run codestyle checks (without modifiying files) for all Julia code in
  the project.

* `make docs`. Generate documentation for the Julia project using the documentation source
  code in the `docs` directory.

* `make clean`. Remove files and directories automatically generated during development
  (e.g., temporary testing and coverage files).

* `make spotless`. Remove files and directories automatically generated during development
  (e.g., temporary testing and coverage files) and project setup (e.g., `Manifest.toml`
  files).

--------------------------------------------------------------------------------------------

## Miscellaneous Templates and Examples

* `templates/envrc`: sample `.envrc` for project

  * __Note__. If used, `envrc` should be renamed to `.envrc` and placed in the project
    root directory

--------------------------------------------------------------------------------------------
