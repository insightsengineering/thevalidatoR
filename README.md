<!-- BEGIN_ACTION_DOC -->
# R Package Validation report

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
* `path`:

  _Description_: Path to package's root

  _Required_: `false`

  _Default_: `.`

* `template_path`:

  _Description_: Template used by the action to generate a report. Defaults to .github/validation_template.rmd

  _Required_: `false`

  _Default_: `""`
  
* `output_type`:

  _Description_: What file type to output. Currently only generating a pdf.

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
    container: rocker/verse:4.1.0 # also versions packages installed via install.packages()
    steps:
      - uses: actions/checkout@v2
      - name: Build report
        uses: insightsengineering/r-pkg-validation@main
        with:
          # R package root path, in case your R package is within a subdirectory of the repo
          path: "."
          # Template location
          template_path: ".github/validation_template.rmd"
          # Output type
          output_type: "pdf"
```
