library(tools)
library(readxl)


# function to obtain file meta data from a directory and convert to a list


file_path_eg <- "dataset_example/Volve_production_data_manipulated.xlsx"

file_name <- basename(file_path_eg)
file_extension <- file_ext(file_path_eg)
file_size <- file.info(file_path_eg)$size
file_creation_time <- file.info(file_path_eg)$ctime
file_modification_time <- file.info(file_path_eg)$mtime
file_access_time <- file.info(file_path_eg)$atime
file_creator <- file.info(file_path_eg)$uname




file_meta_data <- function(file_path){
  tryCatch({
    file_name <- basename(file_path)
    file_extension <- file_ext(file_path)
    file_size <- file.info(file_path)$size
    file_creation_time <- file.info(file_path)$ctime
    file_modification_time <- file.info(file_path)$mtime
    file_access_time <- file.info(file_path)$atime
    file_creator <- file.info(file_path)$uname

    file_meta_data <- list(file_name = file_name,
                           file_extension = file_extension,
                           file_size = file_size,
                           file_creation_time = file_creation_time,
                           file_modification_time = file_modification_time,
                           file_access_time = file_access_time,
                           file_creator = file_creator)

    return(file_meta_data)
  }, error = function(e){
    return(NULL)
  })
}


# Import csv file--------------------------------------------------------------------------------

file_csv_eg <- "dataset_example/Volve_production_data_manipulated.csv"

import_csv <- read.csv("dataset_example/twitter_training.csv")
import_csv2 <- read.csv("dataset_example/iris.csv")


# Import Excel file--------------------------------------------------------------------------------
import_excel <- read_excel("dataset_example/Volve_production_data_manipulated.xlsx")


# Import PDF file--------------------------------------------------------------------------------
# TO DO--




# Function to read file and return data frame-----------------------------------------------------

read_file <- function(file_path){(
  tryCatch({
    file_extension <- file_ext(file_path)

    if(file_extension == "csv"){
      df = read.csv(file_path)
      return(df)
    } else if(file_extension == "xlsx"){
      df = read_excel(file_path)
      return(df)
    } else {
      message("File type is not supported")
    }

  }, error = function(e){
    print("Error to read file")
  })
)}

test_read_file <- read_file("dataset_example/Volve_production_data_manipulated.xlsx")




# create meta_data & read file df as list with embedded note attribute---------------------------------------------------------

meta_data_n_df <- function(file_path, note = NULL){
  tryCatch({
    file_meta_data <- file_meta_data(file_path)
    df <- read_file(file_path)

    meta_data_n_df <- list(file_meta_data = file_meta_data,
                           df = df)
    meta_data_n_df$note <- note
    return(meta_data_n_df)

  }, error = function(e){
    return(NULL)
  })
}


#test mete_data_n_df function--------
test_meta_data_n_df <- meta_data_n_df("dataset_example/Volve_production_data_manipulated.xlsx", "This is a test note")
