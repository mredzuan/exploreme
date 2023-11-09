#' S3 Generic function for statistical centrality values
#'
#' @param x data.frame or vector type object class
#' @param ... Additional arguments affecting the centrality metrics produced.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' #Centrality for data.frame object
#'
#' centrality_iris <- centrality(iris)
#'
#'
#' #Centrality for numeric object
#'
#' centrality_num <- centrality(c(1, 2, 3, 3, 4, 4, 4))
#'
#' }
#'
#
centrality <- function(x, ...){
  UseMethod("centrality")
}



#' Function to generate statistical centrality metrics for data.frame class object
#'
#' @param x Data Frame.
#' @param remove_na a logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds
#' @param ... Ignored
#'
#' @return List object that summarize all numeric columns in data.frame object into mean, median and mode
#' @export

centrality.data.frame <- function(x, remove_na = TRUE, ...) {


  numeric_columns <- sapply(x, is.numeric)
  numeric_res <- x[, numeric_columns]

  if(is.numeric(numeric_res)){
    res <- centrality(numeric_res, remove_na = remove_na)
  } else if(is.data.frame(numeric_res)){
    res <- lapply(numeric_res, centrality, remove_na = remove_na)
  }

  return(res)

}


#' Function to generate statistical centrality metrics for numeric class object
#'
#' @param x Numeric vector
#' @param remove_na a logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.
#' @param ... Ignored
#' @return List object that summarize numeric vector into mean, median and mode
#' @export
centrality.numeric <- function(x, remove_na = TRUE, ...) {

  mean_val <- mean(x, na.rm = remove_na)
  median_val <- median(x, na.rm = remove_na)
  mode_val <- DescTools::Mode(x, na.rm = remove_na)

  res <- list(mean = mean_val, median = median_val, mode = mode_val)
  return(res)

}




#' Default method for centrality generic function
#'
#' @param x Object
#' @param ... Ignored
#' @export
centrality.default <- function(x, ...){
  stop("Please input object with data.frame or numeric class!")
}

