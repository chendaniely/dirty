library(purrr)
library(forcats)
library(tidyr)

head(mtcars)

col_types <- function(df) {
    col_types <- purrr::map(df, class)

    return(col_types)
}

col_unique_ct <- function(df) {
    col_unique_ct <- purrr::map(df, function(x) length(unique(x)))

    return(col_unique_ct)
}

cvt_col_fct <- function(col, bool) {
    if (bool) {
        col <- forcats::as_factor(col)
    } else {
        return(col)
    }
}

num_to_fct <- function(df) {
    col_unique_counts <- col_unique_ct(df)

    threshold_frac <- .2
    threshold_num <- ceiling(nrow(df) * threshold_frac)

    col_to_fct <- col_unique_counts <= threshold_num
    print(col_to_fct)

    df_fct <- purrr::map2_df(df, col_to_fct, cvt_col_fct)

    print(head(df_fct))

    return(df_fct)
}

spread_single_col <- function(df, col, bool, new_col_prefix) {
    if (bool) {
        # df_spread <- tidyr::spread(df, )
    }

    return(df_spread)
}

#' Spread columns that meet certain criteria
spread_cols <- function(df) {
    # spread factor columns
    col_types <- col_types(df)
    col_unique_counts <- col_unique_ct(df)


    # spread character columns
}

dirty <- function(df) {

}


col_metadata(mtcars)

ct <- col_unique_ct(mtcars)

num_to_fct(mtcars)

ct > 3

