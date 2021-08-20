FROM rocker/verse:4.1.0

# Copy validator and template
COPY report-generator.R /main.R
COPY template.Rmd /template.Rmd

# Set entrypoint
ENTRYPOINT ["/main.R"]
