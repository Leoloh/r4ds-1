library(tidyverse)

#q1
rescale01 <- function(x) {
        rng <- range(x, na.rm = FALSE) #change na.rm to FALSE
        (x - rng[1]) / (rng[2] - rng[1])
}

rescale01(c(1,2,3,4,NA,5)) #so what happens if you have an NA in your vector and na.rm set to FALSE is the range will go from NA to NA

#2
x <- c(1:10, Inf, -Inf)

rescale01 <- function(x) {
        for (i in 1:length(x)) {
                if (x[i] == Inf) {
                        x <- replace(x, i, 1)
                }
                if (x[i] == -Inf) {
                        x <- replace(x, i, 0)
                }
        }
        print(x)
        rng <- range(x, na.rm = TRUE, finite = TRUE)
        (x - rng[1]) / (rng[2] - rng[1])
}

rescale01(x) #wohooo this code works! it mapped Inf to 1 and -Inf to 0!

#3
#a
x <- c(1,2,3,4,NA,6,7)
mean(is.na(x)) #comes up with proportion of NAs

NA_proportion <- function(x) {
        mean(is.na(x))
} #this works

#b
x <- c(5,6,8,10,20, NA)
x / sum(x, na.rm = TRUE)

proportion_of_total <- function(x) {
        x / sum(x, na.rm = TRUE)
}
proportion_of_total(x) #this works

#c
x <- c(10,20,30,40,50,NA)

sd(x, na.rm = TRUE) #sd measures the volatility of vector from the mean -- how tightly the values in the dataset are bunched around the mean value. if you replace 20 and 40 with 30, you will find SD coming down. however, if you change vector to (10,10,10,10,50), you will find SD coming up, i guess it's because 50 is much higher than the average.

sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)

coefficient_of_variation <- function(x) {
        sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)
} #coefficient of variation (CV) is an important number to evaluate the relative variability of the data, because lower SD does not always mean lower volatility (eg SD of 0.2 and mean 0.5 has CV of 0.4 or 40%, much higher than the CV for SD of 12 and mean of 80 -- CV = 0.15 or 15%)

#4
#a
variance <- function(x) {
        n <- length(x)
        m <- mean(x)
        (1/(n-1)) * sum((x-m)^2)
}

x <- c(1,4435,5567.3456,7,8234.67325,6.234,576.234,6.457,5.84674567)

y <- variance(x)
z <- var(x)

y == z #be careful with floating point comparison

abs(y-z) < eps

#b

skewness <- function(x) {
        n <- length(x)
        v <- var(x)
        m <- mean(x)
        third.moment <- (1/(n - 2)) * sum((x - m)^3)
        third.moment/(var(x)^(3/2))
}

skewness(x)

#5
vec1 <- c(1,2,4,NA,4,5,NA,4,NA)
vec2 <- c(4,5,3,NA,2,4,NA,3,6)

total <- 0

for (i in 1:length(vec1)) {
        if ((is.na(vec1[i]) & is.na(vec2[i])) == TRUE) {
                total <- total + 1
        }
        print(total)
} #this is the precursor to make sure the function will work, and then copy and paste and put it into a function (below)

both_na <- function(vector1, vector2) {
        total <- 0
        for (i in 1:length(vector1)) {
                if ((is.na(vector1[i]) & is.na(vector2[i])) == TRUE) {
                        total <- total + 1
                }
        }
        return(total)
}

both_na(vec1, vec2) #the code works!

#6
is_directory <- function(x) file.info(x)$isdir #this checks if the input is a folder (directory)
is_directory(dir())

is_readable <- function(x) file.access(x, 4) == 0 #2nd argument is mode, where 4 is 'test for read permission'. if readable, file.access(x,4) should come up 0, so by "== 0" it, it will come up TRUE.
is.readable(dir())

#7
foo_foo <- little_bunny()

foo_foo %>%
        hop(through = forest) %>% #day 1
        scoop(up = field_mouse) %>%
        bop(on = head) %>%
        hop(through = forest) %>% #day 2
        scoop(up = field_mouse) %>%
        bop(on = head) %>%
        hop(through = forest) %>% #day 3
        scoop(up = field_mouse) %>%
        bop(on = head)

daily_activity <- function(one, two, three) {
        hop(through = one) %>%
        scoop(up = two) %>%
        bop(on = three)
}

foo_foo %>%
        for (i in 1:3) {
                daily_activity(forest, field_mouse, head)
        } #this should work, but i don't know if i should use pipe at the end of daily_activities, because i don't want to have a pipe at the last iteration. 

