library(tidyverse)
library(stringr)

#q1---------------------------------------------------------------------------

f1 <- function(string, prefix) {
        substr(string, 1, nchar(prefix)) == prefix
} #better named "check_prefix" <- example: check_prefix("kunlawrence", "kun") should come up TRUE

f2 <- function(x) {
        if (length(x) <= 1) return(NULL)
        x[-length(x)]
} #better named "remove_last_element" <- example: remove_last_element(c(2,3,4,5)) would produce c(2,3,4)

f3 <- function(x, y) {
        rep(y, length.out = length(x))
} #better named "replicate_2nd_with_length_1st" <- example: replicate_2nd_with_length_1st(c(2,3,4,5), 100) would produce c(100,100,100,100)


# q2 ----------------------------------------------------------------------



# q3 ----------------------------------------------------------------------
library(MASS)
#mvrnorm produces one or more samples from the specified multivariate normal distribution
#rnorm = random generation for the normal distribution with mean equal to mean and standard deviation equal to sd


# q4 ----------------------------------------------------------------------

#norm_r() and norm_d() would be better because of Rstudio's autocomplete function, you can easily just type "norm" and all the options would appear.

#rnorm and dnorm would be better because it's more correct (rnorm = generates random vector, normally distributed)
