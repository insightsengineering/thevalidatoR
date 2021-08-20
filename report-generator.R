#!/usr/bin/env Rscript

# Get the action inputs from preset env vars
pkg_root <- Sys.getenv("INPUT_PKG_ROOT")
template_path <- Sys.getenv("INPUT_TEMPLATE_PATH")
report_type <- Sys.getenv("INPUT_REPORT_FORMAT")
report_dir <- Sys.getenv("INPUT_REPORT_DIR")

# Set report file path
report_file_path <- file.path(report_dir, paste0("validation-report.", report_type))

# Navigate to package root
setwd(pkg_root)

# TODO: Implement additional logic

# Placeholder till TODO above is complete
if (!dir.exists(report_dir)) dir.create(report_dir, showWarnings = TRUE, recursive = TRUE, mode = "0777")
file.create(report_file_path)

# Debug
getwd()
list.files(recursive = TRUE)
