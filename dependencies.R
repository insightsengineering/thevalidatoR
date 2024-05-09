#!/usr/bin/env Rscript

# Install latest ackages from Github
# Requires dev version of covr (>= 3.5.1.9003)
# Also install other package dependencies (for tests)
github_packages <- c(
    "r-lib/covr",
    "pharmaR/riskmetric",
    "Genentech/covtracer"
)
lapply(github_packages, remotes::install_github)

# CRAN
options(repos = c("https://cloud.r-project.org/"))
ncores <- parallel::detectCores(all.tests = FALSE, logical = TRUE)
if (!require("git2r")) install.packages("git2r", upgrade = "never", Ncpus = ncores)
if (!require("quarto")) install.packages("quarto", upgrade = "never", Ncpus = ncores)
if (!require("kableExtra")) install.packages("kableExtra", upgrade = "never", Ncpus = ncores)
if (!require("knitr")) install.packages("knitr", upgrade = "never", Ncpus = ncores)
if (!require("tinytable")) install.packages("tinytable", upgrade = "never", Ncpus = ncores)
