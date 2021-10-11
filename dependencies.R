#!/usr/bin/env Rscript

# Install packages from Github
# Requires dev version of covr (>= 3.5.1.9003)
# Also install other package dependencies (for tests)
github_packages <- c(
    "r-lib/covr",
    "pharmaR/riskmetric",
    "genentech/covtracer"
)
lapply(github_packages, remotes::install_github)

# Install TinyTex globally
tinytex::install_tinytex()
system("mv $HOME/bin/* /usr/local/bin")
system("tlmgr install courier ec")
