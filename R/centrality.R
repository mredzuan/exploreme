#Generic function for centerality

centrality <- function(x, ...){
  UseMethod("centrality")
}


#S3 method for data.frame
centrality.data.frame <- function(x, remove_na = TRUE, ...) {

  numeric_columns <- sapply(x, is.numeric)
  numeric_df <- x[, numeric_columns]

  centrality_list <- lapply(numeric_df, function(col, ...){
    mean_val <- mean(col, na.rm = remove_na)
    median_val <- median(col, na.rm = remove_na)

    mode_val <- DescTools::Mode(col, na.rm = remove_na)
    list(mean = mean_val, median = median_val, mode = mode_val)
  })
}




#Test---------

df_test <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Redz"),
  Age = c(25, NA, 30, 28, 22, 22),
  Height = c(160, 175, 180, NA, 165, 165),
  Weight = c(55, 75, NA, 68, 60, 60)
)
