Velexi Julia Project Cookiecutter Release Notes
===============================================

--------------------------------------------------------------------------------------------
0.4.8 (2023-03-26)
==================
### Cookiecutter Template
* Fix broken URL in reference docs.

--------------------------------------------------------------------------------------------
0.4.7 (2023-03-15)
==================
### Cookiecutter Template
* Update CI workflows.
* Fix package name through template.

--------------------------------------------------------------------------------------------
0.4.6 (2023-03-14)
==================
### Cookiecutter Template
* Improve robustness of pre-generation script.

--------------------------------------------------------------------------------------------
0.4.5 (2022-12-24)
==================
### Cookiecutter Template
* Update Python package dependency versions.

### Cookiecutter Development
* Update Python package dependency versions to fix security vulnerabilities.

--------------------------------------------------------------------------------------------
0.4.4 (2022-11-13)
==================
### Cookiecutter Template Enhancements
* Add `--overwrite` arg to jlcodestyle pre-commit hook.
* Add automatic addition of Julia packages required to generate a new Julia package.
* Polish CI GitHub Actions workflow template.
* Update documentation.
* Update Python package dependency versions.

### Cookiecutter Development Enhancements
* Update Python package dependency versions.

--------------------------------------------------------------------------------------------
0.4.3 (2022-10-22)
==================
* Change default value of "ci_include_x86" parameter to "no".

--------------------------------------------------------------------------------------------
0.4.2 (2022-10-17)
==================
* Fix bug in authors field of pyproject.toml files.
* Update documentation.

--------------------------------------------------------------------------------------------
0.4.1 (2022-10-14)
==================
### Cookiecutter Template Enhancements
* Add additional template files (e.g., README.md, NEWS.md)
* Add `github_repo_owner` parameter to cookiecutter.json.
* Move software references to `extras` directory to separate them from project
  documentation.

### Cookiecutter Development Enhancements
* Simplify logic for default values in cookiecutter.json.
* Update documentation.
* Update poetry.lock.

--------------------------------------------------------------------------------------------
0.4.0 (2022-10-10)
==================
### Cookiecutter Template Enhancements
* Restructure the cookiecutter to be compatible with the Cookiecutter template tool.
* Update documentation.

### Cookiecutter Development Enhancements
* Add integrations with tools for supporting code quality: black and git
  pre-commit hooks.

--------------------------------------------------------------------------------------------
0.3.0 (2022-10-04)
==================
### Enhancements
* Added explicit copyright notice when creating projects licensed under Apache License 2.0.
* Simplified command-line options for `create-project`.
* Updated documentation.

### Bug Fixes
* Added explicit copyright notice for the cookiecutter.

--------------------------------------------------------------------------------------------
0.2.2 (2022-04-29)
==================
### Enhancements
* Improved support for private/local Julia registries in template `.envrc` file.
* Improved consistency of file and directory naming.
* Improved documentation.

### Bug Fixes
* Fixed typo in GitHub Actions CI workflow file.
* Fixed copyright notices.
* Restored template parameter to appendix of LICENSE file.

--------------------------------------------------------------------------------------------
0.2.1 (2022-04-04)
==================
* Reorganized and polish documentation.

--------------------------------------------------------------------------------------------
0.2.0 (2022-04-03)
==================
* Restructured project to be a cookiecutter instead of a template. Renamed package.
* Changed repository name from Julia Package Template to Velexi Julia Package Cookiecutter.
* Moved testing tools to a separate Julia package (TestTools.jl).
* Reorganized template and example files.
* Added and updated documentation.

--------------------------------------------------------------------------------------------
0.1.7 (2021-08-31)
==================
* Migrate to semantic version numbers without "v" prefix.
* Update documentation.

--------------------------------------------------------------------------------------------
0.1.6 (2021-06-13)
==================
* Fix dependency errors for example code.
* Improve documentation.
* Polish code.

--------------------------------------------------------------------------------------------
0.1.5 (2021-06-05)
==================
* Reorganize template structure.
  * Simplify directory structure of template.
  * Rename `template-docs/examples` to `template-docs/extras`.
* Improve documentation.

--------------------------------------------------------------------------------------------
0.1.4 (2021-03-15)
==================
* Reorganize package structure.
  * Move template documentation to `template-docs` directory.
  * Move example and template files to `template-docs/examples` directory.
* Improve documentation.

--------------------------------------------------------------------------------------------
0.1.3 (2020-11-14)
==================
* Add support for automatic inclusion of standard set of Julia package
  dependencies.
* Improve testing framework.
* Improve documentation.

--------------------------------------------------------------------------------------------
0.1.2 (2020-11-07)
==================
* Improve template files.
* Fix bugs in coverage.jl.
* Improve documentation.

--------------------------------------------------------------------------------------------
0.1.1 (2020-09-08)
==================
* Improve package organization and structure.
* Improve documentation.

--------------------------------------------------------------------------------------------
0.1.0 (2020-09-07)
==================
* Initial version of package.

--------------------------------------------------------------------------------------------
