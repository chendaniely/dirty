library(purrr)


#' Get the types for each column of a dataframe as a list
col_types <- function(df) {
    col_types <- purrr::map(df, class)

    return(col_types)
}

#' Counts the number of unique values for each column in a dataframe
col_unique_ct <- function(df) {
    col_unique_ct <- purrr::map(df, function(x) length(unique(x)))
    return(col_unique_ct)
}
