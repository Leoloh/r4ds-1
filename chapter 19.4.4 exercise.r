library(tidyverse)
library(lubridate)

# q1 ----------------------------------------------------------------------

#ifelse is only for very short test (test, yes, no). if you have complicated if statements that requires a lot of "else if" statements, use if()


# q2 ----------------------------------------------------------------------
hours_difference <- now(tz = "UTC") - (today()+hours(1)-hours(1))

if (hours_difference < 12) {
        print("Good morning")
} else if (hours_difference < 17){
        print("Good afternoon")
} else {
        print("Good evening")
}


# q3 ----------------------------------------------------------------------
x <- 15

if((x %% 3 == 0) && (x %% 5 == 0)) {
        print("fizzbuzz")
} else if (x %% 5 == 0) {
        print("buzz") 
} else {
        print("fizz")
}

fizzbuzz <- function(x) {
        if((x %% 3 == 0) && (x %% 5 == 0)) {
                print("fizzbuzz")
        } else if (x %% 5 == 0) {
                print("buzz") 
        } else {
                print("fizz")
        }
}

fizzbuzz(9)


# q4 ----------------------------------------------------------------------
temp <- rnorm(1000, mean = 15, sd = 10)

temp2 <- cut(temp, c(-30,0,10,20,30,100), labels = c("freezing", "cold", "cool", "warm", "hot"))

table(temp2)
#that would change the cut to cut(temp, c(-30, 9.9, 19.9, 29.9, 100))
#it creates factor from numerical vector.


# q5 ----------------------------------------------------------------------

mathop <- function(x, y, op) {
        switch(op,
               "1" = x + y,
               "2" = x - y,
               "3" = x * y,
               "4" = x / y,
               stop("Unknown op!"))
        } #it works but you will have to envelope the numeric values in "" in switch (like above) for it to work

mathop(2,3, "3") #here, the op will always have to be enveloped in "" regardless of whether it's numeric or string


# q6 ----------------------------------------------------------------------

mystery <- function(x) {
        switch(x, 
               a = ,
               b = "ab",
               c = ,
               d = "cd"
        )  
} 

mystery("a") #will give "ab". this is because "a" is evaluated but result is missing, so the next non-missing element is evaluated, which is "b"
mystery("b") #same as above
mystery("c") #will give "cd"
mystery("d") #same as above
mystery("e") #gives nothing. value is returned