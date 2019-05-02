# Load package(s)
library(tidyverse)

remove_data <- function(input_file, output_file){
  # Read in csv
  df <- readr::read_csv(input_file)
  # select 50% of rows & colummns
  rows <- sample(1:nrow(df), nrow(df)/2)
  cols <- sample(1:ncol(df), ncol(df)/2)
  # Replace values with empty string
  df[rows,cols] <- ''
  # output dirty csv
  readr::write_csv(df, output_file)
}
