#!/usr/bin/env Rscript

# Location
cat(sprintf("Current dir is: '%s'", getwd()))

# Get the action inputs from preset env vars
pkg_dir <- normalizePath(Sys.getenv("INPUT_REPORT_PKG_DIR", "."))
template_path <- Sys.getenv("INPUT_REPORT_TEMPLATE_PATH", "/template.Rmd")
report_format <- Sys.getenv("INPUT_REPORT_RMARKDOWN_FORMAT", "all")
disable_install_dev_deps <- tolower(Sys.getenv("DISABLE_INSTALL_DEV_DEPS")) %in% c('yes', 'y', 't', 'true')

# fail with meaningful message if REPORT_PKG_DIR does not appear to be a package
if (!file.exists(file.path(pkg_dir, "DESCRIPTION"))) {
  stop(sprintf(
    paste(sep = "\n",
      "Could not find package at '%s'",
      "    ",
      "    Specify a directory by definining environment variable:",
      "        INPUT_REPORT_PKG_DIR=<repository subdirectory>",
      "    "
    ),
    pkg_dir
  ))
}

# Install package dependencies
if (!disable_install_dev_deps){
    options("remotes.git_credentials" = git2r::cred_user_pass(
        username = "token",
        password = remotes:::github_pat()
    ))
    devtools::install_dev_deps(pkg_dir, upgrade = "never")
}

# allow rmarkdown to choose appropriate file extension for output format
report_file_path <- rmarkdown::render(
  template_path,
  output_dir = getwd(),  # create report wherever R script was called
  output_file = "validation_report",
  output_format = report_format,
  params = list(pkg_dir = pkg_dir)
)

cat(sprintf("Created report at: '%s'", report_file_path))
