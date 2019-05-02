library(forcats)
library(purrr)

source('./prototype/dataframe_analysis.R')

# converts a column (vector) into a factor
cvt_col_fct <- function(col, bool) {
    if (bool) {
        col <- forcats::as_factor(col)
    } else {
        return(col)
    }
}

# Converts columns in a dataframe into a factor
# Will work for all types of columns (string/characters, numeric)
cols_to_fct <- function(df, unique_threshold=.2) {
    col_unique_counts <- col_unique_ct(df)

    # if the number of unique values in a column meet a threshold,
    # mark it as a column that will be converted into a factor
    # this will work for numeric columns as well
    threshold_frac <- unique_threshold
    threshold_num <- ceiling(nrow(df) * threshold_frac)
    col_to_fct <- col_unique_counts <= threshold_num
    #print(col_to_fct)

    df_fct <- purrr::map2_df(df, col_to_fct, cvt_col_fct)

    #print(head(df_fct))
    return(df_fct)
}
