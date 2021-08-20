#!/usr/bin/env Rscript

# Get the action inputs from preset env vars
pkg_root <- Sys.getenv("INPUT_PKG_ROOT")
template_path <- Sys.getenv("INPUT_TEMPLATE_PATH")
report_type <- Sys.getenv("INPUT_REPORT_FORMAT")
report_dir <- Sys.getenv("INPUT_REPORT_DIR")

# Navigate to package root
setwd(pkg_root)

# TODO: Implement additional logic
