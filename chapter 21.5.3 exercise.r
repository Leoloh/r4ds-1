library(tidyverse)
library(nycflights13)


# q1 ----------------------------------------------------------------------
# 1
map_dbl(mtcars, mean)

#2
map_chr(flights, typeof)

#3
iris %>%
        map(unique) %>%
        map_dbl(length)

#4
c(-10, 0, 10, 100) %>% #is there a better alternative? i don't know why this works, but it gives correct ans
        map(rnorm, n = 10) %>% #SEE Q3 FOR THE EXPLANATION HOW THIS WORKS.
        map_dbl(mean) 


# q2 ----------------------------------------------------------------------

#is this a trick question? shouldn't it be just:
map_lgl(iris, is.factor)


# q3 ----------------------------------------------------------------------
#it works, q1.4 uses vector that is not a list. q1.1-3 all use lists.

map(1:5, runif) #creates a list of 5. [[1]] contains n = 1 using runif, [[2]] contains n = 2 using runif, etc
#i think this works because runif in this case assumes the vector 1:5 acts as the 'n' (hasn't been explicitly stated)

map(1:5, runif, n = 5) #yes, the hypothesis above was correct. here, 1:5 becomes the next unspecified argument, 'min'
#since 'max' is already 1, having 'min' between 2 and 5 becomes invalid, producing NaN.


# q4 ----------------------------------------------------------------------

map(-2:2, rnorm, n = 5) #works like explained in q3

map_dbl(-2:2, rnorm, n = 5) #error: "result 1 is not a length 1 atomic vector" #not sure why
#if you try do map_dbl(-2:2, rnorm, n = 1)

map_dbl(-2:2, rnorm, n = 1) %>%
        mean()

# q5 ----------------------------------------------------------------------
x <- 0

map(mtcars, function(df) lm(mpg ~ wt, data = df))

map(x, ~lm(mpg ~ wt, data = .))


