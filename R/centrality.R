#Generic function for centrality

#' S3 Generic function for statistic centrality
#'
#' @param x Support data.frame and vector object class
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
#'
#' @examples
#' \dontrun{
#'
#' centrality_iris <- centrality(iris)
#'
#' }
centrality.data.frame <- function(x, remove_na = TRUE) {

  numeric_columns <- sapply(x, is.numeric)
  numeric_df <- x[, numeric_columns]

  centrality_list <- lapply(numeric_df, function(col, ...){
    mean_val <- mean(col, na.rm = remove_na)
    median_val <- median(col, na.rm = remove_na)

    mode_val <- Mode(col, na.rm = remove_na)
    list(mean = mean_val, median = median_val, mode = mode_val)
  })
}




#Test---------

# df_test <- data.frame(
#   Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Redz"),
#   Age = c(25, NA, 30, 28, 22, 22),
#   Height = c(160, 175, 180, NA, 165, 165),
#   Weight = c(55, 75, NA, 68, 60, 60)
# )
