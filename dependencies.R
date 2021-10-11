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
install_tinytex_globally <- function() {
    tinytex_installer <- '
wget -qO- \
    "https://raw.githubusercontent.com/yihui/tinytex/master/tools/install-unx.sh" \
    | sh -s - --admin --no-path
mv ~/.TinyTeX /opt/TinyTeX
/opt/TinyTeX/bin/*/tlmgr path add
tlmgr install \
    makeindex \
    metafont \
    mfware \
    inconsolata \
    tex \
    ae \
    parskip \
    listings \
    xcolor \
    epstopdf-pkg \
    pdftexcmds \
    kvoptions \
    texlive-scripts \
    grfext
tlmgr path add
'

    system(tinytex_installer)
    tinytex::r_texmf()

    permission_update <- '
chown -R root:staff /opt/TinyTeX
chmod -R g+w /opt/TinyTeX
chmod -R g+wx /opt/TinyTeX/bin
export PATH=/opt/TinyTeX/bin:${PATH}
echo "PATH=${PATH}" >> ${R_HOME}/etc/Renviron
'
    system(permission_update)
}
