#' Extract the coefficients and standard errors from a data frame of estimated models
#'
#' Returns a data frame of the estimated coefficients and standard errors for
#' each parameter in each model in a data frame of estimated models.
#' @keywords conjointTools, coefficient, standard error
#' @param models A data frame containing estimated models for a series of
#' different sample sizes.
#' @return A data frame of the estimated coefficients and standard errors for
#' each parameter in each model.
#' @export
#' @examples
#' \dontrun{
#' library(conjointTools)
#'
#' # Define the attributes and levels
#' levels <- list(
#'   price     = seq(1, 4, 0.5), # $ per pound
#'   type      = c('Fuji', 'Gala', 'Honeycrisp', 'Pink Lady', 'Red Delicious'),
#'   freshness = c('Excellent', 'Average', 'Poor')
#' )
#'
#' # Make a full-factorial design of experiment and recode the levels
#' doe <- makeDoe(levels)
#' doe <- recodeDesign(doe, levels)
#'
#' # Make the survey
#' survey <- makeSurvey(
#'     doe       = doe,  # Design of experiment
#'     nResp     = 2000, # Total number of respondents (upper bound)
#'     nAltsPerQ = 3,    # Number of alternatives per question
#'     nQPerResp = 6     # Number of questions per respondent
#' )
#'
#' # Simulate random choices for the survey
#' data <- simulateChoices(
#'     survey    = survey,
#'     altIDName = "altID",
#'     obsIDName = "obsID"
#' )
#'
#' # Estimate models with different sample sizes
#' models <- estimateModels(
#'     nbreaks     = 10,
#'     data        = data,
#'     parNames    = c("price", "type", "freshness"),
#'     choiceName  = "choice",
#'     obsIDName   = "obsID"
#' )
#'
#' # Extract coefficients and standard errors from models
#' results <- getModelResults(models)
#' }
getModelResults <- function(models) {
    # Initiate objects created in data.table so R CMD check won't complain
    sampleSize <- model <- coef <- est <- se <- NULL
    models[, coef := lapply(model, function(x) names(x$standErrs))]
    models[, est := lapply(model, function(x) x$coef)]
    models[, se := lapply(model, function(x) x$standErrs)]
    results <- models[, list(coef[[1]], est[[1]], se[[1]]), by = sampleSize]
    data.table::setnames(results, c("V1", "V2", "V3"), c("coef", "est", "se"))
    return(results)
}
