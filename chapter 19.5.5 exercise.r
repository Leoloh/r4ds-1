library(tidyverse)
library(stringr)


# q1 ----------------------------------------------------------------------

commas <- function(...) stringr::str_c(..., collapse = ", ")

commas(letters, collapse = "-") #gives error. maybe because collapse wasn't defined as an argument in function?


# q2 ----------------------------------------------------------------------

rule <- function(..., pad = "-") {
        title <- paste0(...)
        width <- getOption("width") - nchar(title) - 5 #getOption("width") gives the number of columns on a line
        cat(title, " ", stringr::str_dup(pad, width), "\n", sep = "") #setting pad to "-+" doesn't work because of str_dup, need to modify the width
}

rule("Title", pad = "+-")
rule("Title", pad = "-")

rule <- function(..., pad = "-") {
        title <- paste0(...)
        width <- getOption("width") - nchar(title) - 5 #getOption("width") gives the number of columns on a line
        cat(title, " ", stringr::str_dup(pad, (width/nchar(pad))), "\n", sep = "") 
}

rule("Title", pad = "+-")
rule("Title", pad = "-")


# q3 ----------------------------------------------------------------------

x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

#trim trims the observations from each end of x (in this case [trim = 0.10] takes away 0 and 50, and only computes the mean of 1:10 which comes to 5.5)


# q4 ----------------------------------------------------------------------
#i think the default it "pearson". kendall's tau or spearman's rho statistic is used to estimate a rank-based measure of association. these are more robust and have been recommended if the data do not necessarily come from a bivariate normal distribution

