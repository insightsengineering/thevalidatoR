#!/usr/bin/env Rscript

# Get the action inputs from preset env vars
pkg_root <- Sys.getenv("INPUT_PKG_ROOT")
template_path <- Sys.getenv("INPUT_TEMPLATE_PATH")
report_type <- Sys.getenv("INPUT_REPORT_FORMAT")

# Navigate to package root
setwd(pkg_root)

# Set report file path
report_file_path <- file.path(getwd(), paste0("validation-report.", report_type))

# TODO: Implement additional logic

# Placeholder till TODO above is complete
file.create(report_file_path)
