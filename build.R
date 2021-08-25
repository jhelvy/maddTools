rm(list = ls())
.rs.restartR()

devtools::load_all()
devtools::test()

# Create the documentation for the package
devtools::document()

# Install the package
devtools::install(force = TRUE)

# Build the pkgdown site
pkgdown::build_site()

# Check package
devtools::check()

# Load the package and view the summary
library(maddTools)
help(package = 'maddTools')

# Install from github
devtools::install_github('emse-madd-gwu/maddTools')
