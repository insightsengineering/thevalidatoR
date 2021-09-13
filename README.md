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

* `report_pkg_dir`:

  _Description_: Path to package's root
  
  _Required_: `false`
  
  _Default_: `.`

* `report_template_path`:

  _Description_: File path of the R markdown template to use for the report. The default template is available [here.](./template.Rmd)

  _Required_: `false`

  _Default_: `template.Rmd`
  
* `report_rmarkdown_format`:

  _Description_: The output format to use when rendering the report. Value is used by `rmarkdown::render`'s `output_format` parameter.

  _Required_: `false`

  _Default_: `md_document`

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
          report_pkg_dir: "."
          # Template location
          report_template_path: ".github/validation_template.rmd"
          # Report format - provided to `rmarkdown::render` `output_format`
          report_rmarkdown_format: "pdf_document"
```
