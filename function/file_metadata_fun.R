
# Function to get the meta data of a file and return it as a list
file_meta_data <- function(file_path){
  tryCatch({
    file_name <- basename(file_path)
    file_extension <- file_ext(file_path)
    file_size <- file.info(file_path)$size
    file_creation_time <- file.info(file_path)$ctime
    file_modification_time <- file.info(file_path)$mtime
    file_last_access_time <- file.info(file_path)$atime

    file_meta_data <- list(file_name = file_name,
                           file_extension = file_extension,
                           file_size = file_size,
                           file_creation_time = file_creation_time,
                           file_modification_time = file_modification_time,
                           file_last_access_time = file_last_access_time)

    return(file_meta_data)
  }, error = function(e){
    return(NULL)
  })
}
