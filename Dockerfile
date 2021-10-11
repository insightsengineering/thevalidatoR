FROM docker.io/rocker/verse:4.1.0

# requires dev version of covr (>= 3.5.1.9003)
# also install package dependencies (for tests)
RUN R -e "remotes::install_github('r-lib/covr')" \
      -e "remotes::install_github('pharmaR/riskmetric')" \
      -e "remotes::install_github('genentech/covtracer')" 

# Copy validator and template
COPY report-generator.R /main.R
COPY template.Rmd /github/workspace/template.Rmd

# Set exec permissions on entrypoint script
RUN chmod +x /main.R

# Set entrypoint
ENTRYPOINT ["/main.R"]
