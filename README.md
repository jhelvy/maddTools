
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {maddTools}

<!-- badges: start -->
<!-- badges: end -->

Miscellaneous functions for the GWU course [EMSE 6035: Marketing
Analytics for Design Decisions](https://madd.seas.gwu.edu/)

## Installation

The package can be installed from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("emse-madd-gwu/maddTools")
```

Load the package with:

``` r
library(maddTools)
```

## Contents

This package contains the following functions:

-   `ci()`: Get confidence intervals for a vector of numbers or for
    every column in a data frame of numeric columns.
-   `ggtornado()`: Creates a “tornado” plot using the
    [{ggplot2}](https://ggplot2.tidyverse.org/) package.
-   `mvrnorm()`: Simulate draws from a multivariate normal distribution
    (from the {MASS} package).
-   `logitProbs()`: Computes logit fraction given a set of coefficients
    and alternatives.
-   `rep_df()`: Repeats a data frame `n` times.

To view more details of any of the functions, run `?functionName()` in
R, replacing ‘functionName’ with the name of the function.

## Author, Version, and License Information

-   Author: *John Paul Helveston* <https://www.jhelvy.com/>
-   Date First Written: *August, 25, 2021*
-   License:
    [MIT](https://github.com/emse-madd-gwu/maddTools/blob/master/LICENSE.md)

## Citation Information

If you use this package for in a publication, I would greatly appreciate
it if you cited it - you can get the citation by typing
`citation("maddTools")` into R:

``` r
citation("maddTools")
#> 
#> To cite maddTools in publications use:
#> 
#>   John Paul Helveston (2021). maddTools: Tools For EMSE 6035 -
#>   Marketing Analytics for Design Decisions.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {maddTools: Tools For EMSE 6035 - Marketing Analytics for Design Decisions},
#>     author = {John Paul Helveston},
#>     year = {2021},
#>     note = {R package version 0.0.2},
#>     url = {http://madd.seas.gwu.edu/maddTools/},
#>   }
```
