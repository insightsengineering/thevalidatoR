#!/usr/bin/env Rscript

# Get the action inputs from preset env vars
pkg_dir <- Sys.getenv("INPUT_REPORT_PKG_DIR", ".")
template_path <- Sys.getenv("INPUT_REPORT_TEMPLATE_PATH", "template.Rmd")
report_format <- Sys.getenv("INPUT_REPORT_RMARKDOWN_FORMAT", "all")

# fail with meaningful message if REPORT_PKG_DIR does not appear to be a package
if (!file.exists(file.path(pkg_dir, "DESCRIPTION"))) {
  stop(sprintf(
    paste(sep = "\n",
      "Could not find package at '%s'",
      "    ",
      "    Specify a directory by definining environment variable:",
      "        REPORT_PKG_DIR=<repository subdirectory>",
      "    "
    ),
    pkg_dir
  ))
}

# allow rmarkdown to choose appropriate file extension for output format
rendered_report <- rmarkdown::render(
  template_path,
  output_format = report_format,
  params = list(pkg_dir = pkg_dir)
)

# create a new file path, using extension preferred by report_format
report_ext <- gsub("^[^.]*", "", basename(rendered_report))  # for multi-part exts
report_file_path <- normalizePath(mustWork = FALSE, file.path(
  gsub("/+$", "", dirname(rendered_report)),
  paste0("validation_report", report_ext)
))

file.rename(rendered_report, report_file_path)
cat(sprintf("Created report at: '%s'", report_file_path))
