#!/usr/bin/env Rscript

# Get the action inputs from preset env vars
pkg_root <- Sys.getenv("INPUT_PKG_ROOT")
template_path <- Sys.getenv("INPUT_TEMPLATE_PATH")
report_type <- Sys.getenv("INPUT_REPORT_FORMAT")

# Navigate to package root
setwd(pkg_root)

# Install dependencies
devtools::install_dev_deps()
remotes::install_github("Genentech/covtracer", dependencies = TRUE)

# Set report file path
report_file_path <- file.path(getwd(), paste0("validation-report.", report_type))

# Build report
rmarkdown::render(
  template_path, 
  output_file = report_file_path,
  envir = list2env(list(pkg_root = pkg_root), envir = parent.frame())
  )

# Placeholder till TODO above is complete
if (file.exists(report_file_path)) cat(paste0("Created report at: ", report_file_path))
