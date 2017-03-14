library(tidyverse)
library(nycflights13)
library(stringr)

# q1 ----------------------------------------------------------------------

#########
output <- vector("double", ncol(mtcars))

for (i in seq_along(mtcars)) {
        output[[i]] <- mean(mtcars[[i]])
}

########
output <- vector("character", ncol(flights))

for (i in seq_along(flights)) {
        output[[i]] <- typeof(flights[[i]])
}

########
output <- vector("double", ncol(iris))

for (i in seq_along(iris)) {
        output[[i]] <- length(unique(iris[[i]]))
}

##########
mu <- c(-10, 0, 10, 100)
output <- data.frame(1:10)

for (i in seq_along(mu)) {
       output[i+1] <- rnorm(n = 10, mean = mu[i])
}


# q2 ----------------------------------------------------------------------
#################
out <- ""
for (x in letters) {
        out <- stringr::str_c(out, x)
}
out

str_c(letters, sep = "") #the 'letters' vector isn't collapsed
str_c(letters, collapse = "") #this produces the same result as the for loop

###############
x <- sample(100)
sd <- 0
for (i in seq_along(x)) {
        sd <- sd + (x[i] - mean(x)) ^ 2
}
sd <- sqrt(sd/(length(x) - 1))

#replace the above with
x <- sample(100)
sd <- sum((x-mean(x))^2)
sd <- sqrt(sd/(length(x)-1))

####################3
x <- runif(100)
out <- vector("numeric", length(x))
out[1] <- x[1]
for (i in 2:length(x)) {
        out[i] <- out[i - 1] + x[i]
}

out <- x + sum(x[1:which(x)]) #i can't solve this yet!!!


# q3 ----------------------------------------------------------------------
###########################3
prints <- function() {
        numbers <- c("five", "four", "three", "two", "one" ,"no")
        last_1 <- "So go, Alice, go."
        last_2 <- "Now Alice is a horse"
        
        for (i in seq_along(numbers)) {
                for (j in 1:4) {
                        cat("Alice the camel has", numbers[i], "humps","\n")
                }
                if (i < 6) {
                        cat(last_1, "\n", "\n")
                }
                else {
                        cat(last_2, "\n", "\n")
                }
        }
}

prints()

###########################################
ten_in_bed <- function(number) {
        counter <- number:1
        cat("Here we go!", "\n")
        
        last_1 <- "So they all rolled over and one fell out."
        last_2 <- "I'm lonely..."
        
        for (i in seq_along(counter)) {
                cat("There were", counter[i], "in the bed", "\n")
                cat("and the little one said,", "\n")
                if(counter[i] > 1) {
                        cat("\"Roll over, roll over\"", "\n")
                        cat("So they all rolled over and one fell out.", "\n", "\n")
                }
                else {
                        cat("\"I'm lonely...\"", "\n", "\n")
                }
        }
}

ten_in_bed(6)

##########################################3
beer_bottles <- function(number) {
        counter <- number:1
        counter[number+1] <- "No"
        
        for (i in seq_along(counter)) {
                cat(counter[i], "bottles of beer on the wall,", counter[i], "bottles of beer", "\n")
                
                if (counter[i] != "No") {
                        cat("Take one down and pass it around,", counter[i+1], "bottles of beer on the wall.", "\n", "\n")
                }
                else {
                        cat("Go to the store and buy some more,", counter[1], "bottles of beer on the wall.")
                }
        }
}

beer_bottles(4)