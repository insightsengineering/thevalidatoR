#!/usr/bin/env Rscript

# Location
cat(sprintf("Current dir is: '%s'", getwd()))

# CVE-2022-24765 exception
git_safe_dir <- system(
  sprintf("git config --global --add safe.directory '%s'", getwd())
)

cat(paste0("INPUT_REPORT_PKG_DIR = ", Sys.getenv("INPUT_REPORT_PKG_DIR", ".")))

# Get the action inputs from preset env vars
pkg_dir <- normalizePath(Sys.getenv("INPUT_REPORT_PKG_DIR", "."))
template_path <- Sys.getenv("INPUT_REPORT_TEMPLATE_PATH", "./template.qmd")
disable_install_dev_deps <- tolower(
  Sys.getenv("DISABLE_INSTALL_DEV_DEPS")
) %in% c("yes", "y", "t", "true")

# fail with meaningful message if REPORT_PKG_DIR does not appear to be a package
desc_file <- file.path(pkg_dir, "DESCRIPTION")
if (!file.exists(desc_file)) {
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
if (!disable_install_dev_deps) {
    options("remotes.git_credentials" = git2r::cred_user_pass(
        username = "token",
        password = remotes:::github_pat()
    ))
    devtools::install_dev_deps(pkg_dir, upgrade = "never")
}

library(quarto)
cat(paste0("Running Quarto render for template: ", template_path))
quarto_render(template_path, output_file = "validation_report.pdf", debug = TRUE)
