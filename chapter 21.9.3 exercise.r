library(tidyverse)


# q1 ----------------------------------------------------------------------

x <- list ( 1, 'a', 3)
y <- list(1,2,3)

x %>%
        every(is.numeric) #FALSE

y %>%
        every(is.numeric) #TRUE

my_every <- function(vector, func, ...) {
        out <- vector("logical", length(vector))
        for (i in seq_along(vector)) {
                out[[i]] <- func(vector[[i]])
        }
        if(sum(out) == length(vector)) {
                print(TRUE)
        }
        else {
                print(FALSE)
        }
} 

my_every(x, is.numeric) #FALSE
my_every(y, is.numeric) #TRUE
#it seems to work, but maybe there are other predicates besides is.numeric that won't work with mine.
#every() takes on "..." argument, while mine only takes 2


# q2 ----------------------------------------------------------------------
col_summary <- function(df, fun) {
        out <- vector("double", length(df))
        for (i in seq_along(df)) {
                out[i] <- fun(df[[i]])
        }
        out
} #this above is the original col_sum given by Hadley

col_summary(iris, median) #error because 1 column is not numeric. need to discard it first


col_summary_enhanced <- function(df) {
        df <- df %>% 
                keep(is.numeric) #discards the non-numeric column
        
        map(df, summary)
        }

col_summary_enhanced(iris)


# q3 ----------------------------------------------------------------------

#below is the buggy code provided by Hadley
col_sum3 <- function(df, f) {
        is_num <- sapply(df, is.numeric)
        df_num <- df[, is_num]
        
        sapply(df_num, f)
}

#below is the input that produces errors
df <- tibble(
        x = 1:3,
        y = 3:1,
        z = c("a", "b", "c")
)

col_sum3(df, mean)l

col_sum3(df[1:2], mean)
col_sum3(df[1], mean)
col_sum3(df[0], mean)


#
#this is my solution. but caveat, i find only the df[0] produced error, and i think that's because R is not
#zero-indexed while the argument wanted index 0. my solution is just another way to produce same results

col_sum4 <- function(df, f) {
        df_num <- keep(df, is.numeric)
        
        map(df_num, f) 
}

col_sum4(df, mean)
col_sum4(df[1:2], mean)
col_sum4(df[1], mean)
col_sum4(df[0], mean)