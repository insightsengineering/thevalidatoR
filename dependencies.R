#!/usr/bin/env Rscript

# Install latest ackages from Github
# Requires dev version of covr (>= 3.5.1.9003)
# Also install other package dependencies (for tests)
github_packages <- c(
    "r-lib/covr",
    "pharmaR/riskmetric",
    "genentech/covtracer"
)
lapply(github_packages, remotes::install_github)

# CRAN
options(repos = c("https://cloud.r-project.org/"))
ncores <- parallel::detectCores(all.tests = FALSE, logical = TRUE)
if (!require("kableExtra")) install.packages("kableExtra", upgrade = "never", Ncpus = ncores)
if (!require("tinytex")) install.packages("tinytex", upgrade = "never", Ncpus = ncores)

# Conditionally install TinyTex
if(!dir.exists("/__w/_temp/TinyTeX")) {
# nolint start
  tinytex_installer <- '
export TINYTEX_DIR=/__w/_temp/TinyTeX
wget -qO- "https://raw.githubusercontent.com/yihui/tinytex/master/tools/install-unx.sh" | sh -s - --admin --no-path
mkdir -p /__w/_temp/TinyTeX
cp -r ~/.TinyTeX/. /__w/_temp/TinyTeX
rm -rf ~/.TinyTeX
/__w/_temp/TinyTeX/bin/*/tlmgr path add
tlmgr install latex-bin luatex xetex ae bibtex context inconsolata listings makeindex metafont mfware parskip pdfcrop tex tools url xkeyval courier ec
tlmgr path add
'
  # nolint end
  system(tinytex_installer)
  tinytex::r_texmf()
  permission_update <- '
chown -R root:staff /__w/_temp/TinyTeX
chmod -R g+w /__w/_temp/TinyTeX
chmod -R g+wx /__w/_temp/TinyTeX/bin
export PATH=/__w/_temp/TinyTeX/bin:${PATH}
echo "PATH=${PATH}" >> $GITHUB_ENV
'
  system(permission_update)
}
