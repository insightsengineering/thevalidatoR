<!-- BEGIN_ACTION_DOC -->
# R Package Validation Report

### Description

A Github Action that generates a validation report for an R package. The four main steps are:

- Run `R CMD check`
- Run `covr::package_coverage()`
- Run `covtracer` (when open sourced - leave out for now)
- Place results into report
- Attach report as object to release

### Action Type
Docker

### Author
Roche

### Inputs
* `pkg_root`:

  _Description_: Path to package's root

  _Required_: `false`

  _Default_: `.`

* `template_path`:

  _Description_: File path of the R markdown template to use for the report. The default template is available [here.](./template.Rmd)

  _Required_: `false`

  _Default_: `"template.Rmd"`
  
* `report_format`:

  _Description_: The file format of the validation report. Options: `pdf`, `html`, `word`, `odt`, `markdown`

  _Required_: `false`

  _Default_: `"pdf"`

### Outputs
None

<!-- END_ACTION_DOC -->

## How to use

To use this GitHub Action you will need to complete the following:

* Create a new file in your repository called `.github/workflows/r-pkg-validation.yml`
* Copy the template over (and edit if you wish to modify it)

### Quickstart

In your repository you should have a `.github/workflows/r-license-report.yml` folder with GitHub Action similar to below:

```yaml
---
name: R Package Validation report

on:
  release:
    types: [published]

jobs:
  r-pkg-validation:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build report
        uses: insightsengineering/r-pkg-validation@main
        with:
          # R package root path, in case your R package is within a subdirectory of the repo
          pkg_root: "."
          # Template location
          template_path: ".github/validation_template.rmd"
          # Report format
          report_format: "pdf"
```
