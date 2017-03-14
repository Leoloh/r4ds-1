library(tidyverse)


# q1 ----------------------------------------------------------------------

#what 2d case?


# q2 ----------------------------------------------------------------------

col_summary <- function(df, fun) {
        out <- vector("double", length(df))
        for (i in seq_along(df)) {
                if(is.numeric(df[[i]]) == TRUE) { #this is the modification
                        out[i] <- fun(df[[i]])
                }
        }
        out
}

col_summary(iris, median)
