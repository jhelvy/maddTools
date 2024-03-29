% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ci.R
\name{ci}
\alias{ci}
\title{Get a confidence interval for every column in a data frame}
\usage{
ci(df, ci = 0.95)
}
\arguments{
\item{df}{A data frame with all numeric columns.}

\item{ci}{The sensitivity of the computed confidence interval (CI).
Defaults to \code{ci = 0.95}, reflecting a 95\% CI.}
}
\description{
Returns a data frame with the columns 'mean', 'lower', and 'upper'
reflecting the mean and lower and upper bounds of a confidence
interval for every column in the data frame
}
\examples{
df <- data.frame(
  unif = runif(1000, 0, 1),
  norm = rnorm(1000, 0, 1),
  lnorm = rlnorm(1000, 0, 1)
)

ci(df)

}
