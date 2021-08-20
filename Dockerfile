FROM rocker/verse:4.1.0

# Copy validator and template
COPY report-generator.R /main.R
COPY template.Rmd /template.Rmd

# Set exec permissions on entrypoint script
RUN chmod +x /main.R

# Set entrypoint
ENTRYPOINT ["/main.R"]
