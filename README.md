<!-- BEGIN_ACTION_DOC -->
# R Package Validation Report

### Description

A Github Action that generates a validation report for an R package. The four main steps are:

- Run `R CMD check` (check installation)
- Run `covr::package_coverage()` (check unit test coverage)
- Run `covtracer` (link documentation to unit tests)
- Place results into report
- _If valtools present - run valtools and also publish report?_ (to discuss)
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

  _Default_: `pdf_document`

### Outputs
None

<!-- END_ACTION_DOC -->

## How to use

To use this GitHub Action you will need to complete the following:

* Create a new file in your repository called `.github/workflows/r-pkg-validation.yml`
* Copy the template over (and edit if you wish to modify it)

### Quickstart

In your repository you should have a `.github/workflows/validatoR.yml` file with GitHub Action similar to below:

```yaml
---
name: R Package Validation report

on: # Run this action when a release is published
  release:
    types: [published]

jobs:
  r-pkg-validation:
    name: Create report 📃
    runs-on: ubuntu-latest
    # Set Github token permissions
    permissions:
      contents: write
      packages: write
      deployments: write
    steps:
      - name: Checkout repo 🛎
        uses: actions/checkout@v2

      - name: Build report 🏗
        uses: insightsengineering/thevalidatoR@main

      # Upload the validation report to the release
      - name: Upload report to release 🔼
        if: success()
        uses: svenstaro/upload-release-action@v2
        with:
          file: ./validation_report.pdf
          asset_name: validation-report.pdf
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          tag: ${{ github.ref }}
          overwrite: false
```
