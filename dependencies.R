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
if (!require("kableExtra")) install.packages("kableExtra", upgrade = "never", Ncpus = ncores)
if (!require("tinytex")) install.packages("tinytex", upgrade = "never", Ncpus = ncores)

# Conditionally install TinyTex
if(!dir.exists(paste(Sys.getenv("RUNNER_TEMP"), "TinyTeX", sep="/"))) {
# nolint start
  tinytex_installer <- '
export TINYTEX_DIR=${RUNNER_TEMP}/TinyTeX
wget -qO- "https://raw.githubusercontent.com/yihui/tinytex/master/tools/install-unx.sh" | sh -s - --admin --no-path
mkdir -p ${RUNNER_TEMP}/TinyTeX
cp -r ~/.TinyTeX/. ${RUNNER_TEMP}/TinyTeX
rm -rf ~/.TinyTeX
${RUNNER_TEMP}/TinyTeX/bin/*/tlmgr path add
tlmgr update --self
tlmgr install latex-bin luatex xetex ae bibtex context inconsolata listings makeindex metafont mfware parskip pdfcrop tex tools url xkeyval
'
  # nolint end
  system(tinytex_installer)
  tinytex::r_texmf()
  permission_update <- '
chown -R root:staff ${RUNNER_TEMP}/TinyTeX
chmod -R g+w ${RUNNER_TEMP}/TinyTeX
chmod -R g+wx ${RUNNER_TEMP}/TinyTeX/bin
'
  system(permission_update)
}
