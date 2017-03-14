library(tidyverse)
library(nycflights13)
library(stringr)


# q1 ----------------------------------------------------------------------

files <- dir("data/", pattern = "\\.csv$", full.names = TRUE)

out <- vector("list", length(files))

for (i in seq_along(files)) {
        out[[i]] <- read_csv(files[[i]])
}

bind_rows(out) #this code works


# q2 ----------------------------------------------------------------------

x <- list("a", "b", "c")
        
z <- list(a = 1, b = "c", c = 1:3)
names(z)

for(nm in names(z)) {
        print(nm)
}

for(nm in names(x)) { #if your list has no names, then it won't print anything. no error as well
        print(nm)
}

y <- list(a = 1, b = "c", 1:3)
names(y)

for(nm in names(y)) { #the third element will simply print "" instead of nothing.
        print(nm)
}

k <- list(a = 1, b = "c", b = 1:3)
names(k)

for(nm in names(k)) { #having two identical names gives no error. prints as normal
        print(nm)
}


# q3 ----------------------------------------------------------------------
show_mean <- function(df) {
        df <- as_tibble(df)
        out <- vector("list", length(df))
        for(i in seq_along(df)) {
                if((class(df[[i]]) == "numeric") || (class(df[[i]]) == "integer")) {
                        out[[i]] <- cat(names(df[i]), ":", round(mean(df[[i]]), digits = 2), "\n")
                }
        }
} #TO GET THE NUMBERS LINED UP NICELY, USE SOLUTION FROM Q2 IN EXERCISE CHP 19.5.5


# q4 ----------------------------------------------------------------------
trans <- list( 
        disp = function(x) x * 0.0163871,
        am = function(x) {
                factor(x, labels = c("auto", "manual"))
        }
)
for (var in names(trans)) {
        mtcars[[var]] <- trans[[var]](mtcars[[var]])
}

     #code above changes the values for "disp" and "am" columns. it would multiply "disp" values by 0.016..,
        #and change "am" values to either "auto" or "manual"

        #in 1st iteration, var = "disp". code becomes: mtcars[["disp"]] <- trans[["disp"]](mtcars[["disp"]])
        #so you are changing the values for disp column in mtcars, using trans' disp function (x = mtcars[["disp"]])

