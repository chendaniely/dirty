# Load package(s)
library(tidyverse)


# Read in csv
df <- readr::read_csv("data/mtcars.csv")

# select 50% of rows & colummns
rows <- sample(1:nrow(df), nrow(df)/2)
cols <- sample(1:ncol(df), ncol(df)/2)

# Replace values with empty string
df[rows,cols] <- ''



# output dirty csv
readr::write_csv(df, "data/dirtycars.csv")


