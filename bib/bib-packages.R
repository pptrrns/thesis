#----- R Code

# Mariana Sánchez Mendoza & José Ángel Torrens Hernández

#----- Install required packages

# install.packages('report') install.packages('knitr') install.packages('MatchIt')
# install.packages('devtools') devtools::install_github('r-lib/conflicted')

#----- Load libraries

library(report)
library(knitr)
library(MatchIt)
library(conflicted)

#----- Manage package citations

# Automatically cite all packages used in the current R session

report::cite_packages()

# Generate BibTeX citation for a specific package (e.g., MatchIt)

toBibtex(citation("MatchIt"))

# Note: To use citation entries generated from toBibtex(), you typically need to copy the output manually to
# a .bib file and add citation keys manually (e.g., change @Manual{, to @Manual{R-MatchIt,).

# Automate this process with knitr::write_bib(), which generates citation entries for all specified packages
# and automatically adds citation keys.  This writes the BibTeX entries for the currently loaded packages
# and specified additional packages (e.g., tidyverse, stargazer, janitor) to a .bib file.

knitr::write_bib(c(.packages(), "MatchIt"), "r-packages.bib")