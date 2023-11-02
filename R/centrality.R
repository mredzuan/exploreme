#' S3 Generic function for statistic centrality
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
#' @param remove_na a logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.
#'
#' @return List object that summarize all numeric columns in data.frame object into mean, median and mode
#' @export

centrality.data.frame <- function(x, remove_na = TRUE) {

  numeric_columns <- sapply(x, is.numeric)
  numeric_df <- x[, numeric_columns]

  centrality_list <- lapply(numeric_df, function(col, ...){
    mean_val <- mean(col, na.rm = remove_na)
    median_val <- median(col, na.rm = remove_na)

    mode_val <- DescTools::Mode(col, na.rm = remove_na)
    res <- list(mean = mean_val, median = median_val, mode = mode_val)
    return(res)
  })
}






#' Function to generate statistical centrality metrics for numeric class object
#'
#' @param x Numeric vector
#' @param remove_na a logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.
#'
#' @return List object that summarize numeric vector into mean, median and mode
#' @export
centrality.numeric <- function(x, remove_na = TRUE) {

  mean_val <- mean(x, na.rm = remove_na)
  median_val <- median(x, na.rm = remove_na)
  mode_val <- DescTools::Mode(x, na.rm = remove_na)

  res <- list(mean = mean_val, median = median_val, mode = mode_val)
  return(res)

}




#' Default method for centrality generic function
#'
#' @param x Object
#' @export
centrality.default <- function(x){
  stop("Please input object with data.frame or numeric class!")
}



#Test---------

# df_test <- data.frame(
#   Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Redz"),
#   Age = c(25, NA, 30, 28, 22, 22),
#   Height = c(160, 175, 180, NA, 165, 165),
#   Weight = c(55, 75, NA, 68, 60, 60)
# )




