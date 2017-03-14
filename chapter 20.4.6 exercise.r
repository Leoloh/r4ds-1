library(tidyverse)


# q1 ----------------------------------------------------------------------

#mean(is.na(x)) will give you a proportion of the vector that is NA
#sum(!is.finite(x)) will give you the number of elements in the vector that is not finite (so either NA, NaN, or Inf)


# q2 ----------------------------------------------------------------------

#is.vector tests whether a vector x is of a specified mode, and has only the name attribute, nothing else. 
#is.atomic tests whether a vector x is of an atomic type (or NULL)


# q3 ----------------------------------------------------------------------
#both name a vector using a shorter form. purrr's set_names is more stricter (if the length of argument 1 and 2 not the same, should be error)

setNames(1:3, c("a","b","c"))
set_names(1:3, c("a","b","c")) #same results

setNames(1:3, c("a","b","c", "d"))
set_names(1:3, c("a","b","c","d")) #errors for both

setNames(1:3, c("a","b"))
set_names(1:3, c("a","b")) #error for set_names, works for setNames

setNames(1:3)
set_names(1:3) #works for set_names only


# q4 ----------------------------------------------------------------------

x <- c(1:10, 20:30, NA, 40:50)

last_value <- function (x) {
        return(x[[length(x)]])
}

last_value(x) #both [] and [[]] gives the same result here

###############################
even_position <- function(x) {
        return(x[x%%2 == 0])
}

even_position(x) #works for [] but error for [[]] ('attempt to select more than one element in vectorIndex')

################################
every_element <- function(x) {
        return(x[-length(x)])
}

every_element(x) #works for [] but error for [[]] ('attempt to select more than one element in integerOneIndex')

###############################
even_noNA <- function(x) {
        return(x[(x%%2 == 0) & (!is.na(x) == TRUE)])
}

even_noNA(x)

even_noNA <- function(x) {
        x[(x%%2 == 0) & (!is.na(x) == TRUE)]
}

even_noNA(x) #using return() or just the x directly makes no difference here


# q5 ----------------------------------------------------------------------

x <- -5:5

x[-which(x > 0)]
x[x <= 0] #both have the same results?


# q6 ----------------------------------------------------------------------

length(x)
length(x)+1

x[length(x)]
x[length(x)+1] #subsetting with positive integer larger than the length of the vector will give NA

x["abc"] #subsetting with a name that doesn't exist will give NA