# This function takes draws of estimated model coefficients and computes the
# logit fraction with each set of draws and returns a mean result with a
# lower and upper bound from a 95% confidence interval.


#' Computes logit fraction given a set of coefficients and alternatives
#'
#' Returns a data frame of the predicted probabilities (with a confidence)
#' interval) for a set of coefficients (or coefficient draws) and a data frame
#' of alternatives.
#' @param coefs A matrix of coefficients or draws of coefficients.
#' @param alts A data frame of a set of alternatives for which to predict
#' choices. Each row is an alternative and each column an attribute
#' corresponding to parameter names in the estimated model.
#' @param altID The name of the column that identifies each alternative
#' in each set of alternatives.
#' @param obsID The name of the column that identifies each set of
#' alternatives. Required if predicting results for more than one set of
#' alternatives. Defaults to `NULL` (for a single set of alternatives).
#' @param ci The sensitivity of the computed confidence interval (CI).
#' Defaults to `ci = 0.95`, reflecting a 95% CI.
#' @export
logitProbs <- function(coefs, alts, altID, obsID, ci=0.95) {
    obsID <- alts[, obsID]
    recoded <- logitr::recodeData(alts, colnames(coefs), NULL)
    expV <- exp(recoded$X %*% t(coefs))
    sumExpV <- rowsum(expV, group = obsID, reorder = FALSE)
    reps <- table(obsID)
    probs <- expV / sumExpV[rep(seq_along(reps), reps),]
    return(maddTools::ci(t(probs), ci))
}
