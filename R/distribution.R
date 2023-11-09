
#' S3 Generic function for statistical distribution or quantiles values
#'
#' @param x data.frame or vector type object class
#' @param ... Additional arguments affecting the distribution values produced.
#'   e.g: `remove_na`: a logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.
#'        `probs`: numeric vector of probabilities with values in value from 0 to 1 (e.g: default c(0, 0.25, 0.5, 0.75, 1))
#'
#' @return A list of statistical distribution which include min, max, and quantile values of numeric values from data.frame or vector object
#' @export
#'
#' @examples
#' \dontrun{
#'
#' #Distribution for numeric columns from data.frame
#' distribution_iris <- distribution(iris, remove_na = TRUE)
#'
#'
#'
#' #Distribution for numeric's vector
#' #remove_na is default to TRUE. Missing values and NaN's not allowed if 'remove_na' is FALSE
#'
#' distribution_num <- distribution(c(1, 2, 3, 3, 4, 4, 4, NA), remove_na = TRUE)
#'
#' }
#'
#'
distribution <- function(x, ...){
  UseMethod("distribution")
}



#' Method's function to generate distribution or quantiles values for numeric vector
#'
#' @param x Numeric vector
#' @param remove_na A logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.
#' @param probs numeric vector of probabilities with values in value from 0 to 1 (e.g: default c(0, 0.25, 0.5, 0.75, 1))
#' @param ... Ignored
#'
#' @return A list of statistical distribution which include min, max, and quantile values of numeric values from vector object
#' @export
#'
#' @seealso [distribution()]
distribution.numeric <- function(x, remove_na = TRUE, probs = c(0, 0.25, 0.5, 0.75, 1), ...){

  min_val <- min(x, na.rm = remove_na)
  max_val <- max(x, na.rm = remove_na)

  quant <- quantile(x, probs = probs, na.rm = remove_na)
  quant <- as.list(quant)

  res <- list(min = min_val,
              max = max_val,
              quantile = quant)

  return(res)

}



#' Method's function to generate distribution or quantiles values for numeric vector
#'
#' @param x data.frame object
#' @param remove_na A logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.
#' @param probs numeric vector of probabilities with values in value from 0 to 1 (e.g: default c(0, 0.25, 0.5, 0.75, 1))
#' @param ... Ignored
#'
#' @return A list of statistical distribution which include min, max, and quantile values of numeric values from data.frame
#' @export
#'
#' @seealso [distribution()]
distribution.data.frame <- function(x, remove_na = TRUE, probs = c(0, 0.25, 0.5, 0.75, 1), ...){

  numeric_columns <- sapply(x, is.numeric)
  numeric_res <- x[, numeric_columns]

  if(is.numeric(numeric_res)){
    res <- distribution(numeric_res, remove_na = remove_na, probs = probs)
  } else if(is.data.frame(numeric_res)){
    res <- lapply(numeric_res, distribution, remove_na = remove_na, probs = probs)
  }

  return(res)

}


#' Default method for distribution generic function
#'
#' @param x Object
#' @param ... Ignored
#' @export
distribution.default <- function(x, ...){
  stop("Please input object with data.frame or numeric class!")
}
