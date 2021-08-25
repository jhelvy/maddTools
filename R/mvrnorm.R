#' Simulate from a Multivariate Normal Distribution
#'
#' Produces one or more samples from the specified multivariate normal
#' distribution. Copied from MASS::mvrnorm().
#' @param n the number of samples required.
#' @param mu a vector giving the means of the variables.
#' @param Sigma a positive-definite symmetric matrix specifying the
#' covariance matrix of the variables.
#' @param tol tolerance (relative to largest variance) for numerical lack
#' of positive-definiteness in `Sigma`.
#' @param empirical logical. If true, mu and Sigma specify the empirical
#' not population mean and covariance matrix.
#' @param EISPACK logical: values other than `FALSE` are an error.
#' @return If `n = 1` a vector of the same length as `mu`, otherwise an
#' `n` by `length(mu)` matrix with one sample in each row.
#' @export
#' @examples
#' Sigma <- matrix(c(10,3,3,2),2,2)
#' Sigma
#' var(mvrnorm(n = 1000, rep(0, 2), Sigma))
#' var(mvrnorm(n = 1000, rep(0, 2), Sigma, empirical = TRUE))
#'
mvrnorm <- function(
    n = 1, mu, Sigma, tol=1e-6, empirical = FALSE, EISPACK = FALSE
) {
    return(MASS::mvrnorm(n, mu, Sigma, tol, empirical, EISPACK))
}
