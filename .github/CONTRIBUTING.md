# Contributing to thevalidatoR

:+1::tada: Before we jump in - thanks for getting this far! :tada::+1:

All discussions are open and inclusive on this repo. If you have an idea, or but - please make an issue! 

## Code of conduct

This project follows the [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](.github/CODE_OF_CONDUCT.md).

## Contributions

PRs are welcome.

## Proposal for a 'validation documentation' sub-team in the R Validation Hub

**This is a proposal, and not our current collaboration model**

### Purpose

The core purpose of this gh-action is to provide a common template, that can be applied 
to packages to generate automated documentation detailing the installation, assessment 
of unit tests, and cross referencing what defined features from the documentation are 
tested (buy building the tracibility matrix).

The intended aim is that the gh-action can be used to provide 'shared' 
validation documentation between companies. The expectation is that validation 
would then take place by installing and testing the package against the actual 
environments present in each company. 

While discussions are on-going around 'assessment' of packages meeting 
required validation thresholds for each company (and sharing the components
of this human based process between companies), the scope of this working group is 
focussed on the 'automated' documentation.

### Position in R Validation Hub

The R Validation Hub is a PSI and R Consortium Working Group. Currently within 

### Governance

* Decisions (and discussions) will always be documented, as either github issues or github discussions.
* Contributions and discussions will in all cases be open (and present in Github)
* The team will remain a meritocracy, and as it's an activity 

#### Github repositary maintainers / admins

In addition to the org admins having access, adding an individual to the repository  
will be based on meritocracy, based on contributions made as an external contributor and 
no disagreement from the current maintainers. `org [currently insightsengineering, proposal is pharmar]` admins retain the right to remove 
individuals if the code of conduct is breached.

* James Black (@epijim)
* Doug Kelhkoff (@dgkf-roche)
* Andy Nicholls (@andyofsmeg)
* Ellis Hughes (@thebioengineer)
* Dawid Rycerz (@knightdave)

#### Responsibilities to the R validation Hub

* `thevalidatoR` is a project analogous to `riskmetric` and the R assessment shiny app, so no additional formal meeting structure is required, beyond commitments from the package maintainers to continue to be available to update the wider team on current status.
* A named maintainer (James Black as of today) will maintain the dicussion, road map / kanban and ensure releases are documented.