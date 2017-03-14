library(tidyverse)
library(modelr)


# q1 ----------------------------------------------------------------------

sim1a <- tibble(
        x = rep(1:10, each = 3),
        y = x * 1.5 + 6 + rt(length(x), df = 2)
)

sim1a_mod <- lm(y ~ x, data = sim1a)

coef(sim1a_mod)

sim1a %>%
        ggplot(aes(x, y)) +
        geom_point() +
        geom_abline(intercept = sim1a_mod[[1]][[1]], slope = sim1a_mod[[1]][[2]])

######performing multiple simulations

rerun_simulation <- function(times) {
        for (i in 1:times) {
                sim1a <- tibble(
                        x = rep(1:10, each = 3),
                        y = x * 1.5 + 6 + rt(length(x), df = 2)
                )
                
                sim1a_mod <- lm(y ~ x, data = sim1a)
                print(i)
                print(coef(sim1a_mod))
                
                plot <- sim1a %>%
                        ggplot(aes(x, y)) +
                        geom_point() +
                        geom_abline(intercept = sim1a_mod[[1]][[1]], slope = sim1a_mod[[1]][[2]])
                
                print(plot)
        }
}

rerun_simulation(5) 
 #from the model, i notice that the slope (x) and the intercept are pretty stable across simulations


# q2 ----------------------------------------------------------------------
sim1a <- tibble(
        x = rep(1:10, each = 3),
        y = x * 1.5 + 6 + rt(length(x), df = 2)
)

make_prediction <- function(a, data) {
        a[1] + data$x * a[2]
}

measure_distance <- function (mod, data) {
        diff <- data$y - make_prediction(mod, data)
        mean(abs(diff))
}

best <- optim(c(0,0), measure_distance, data = sim1a)

best$par #this is the result using optim (1st number = intercept, 2nd = slope)

linear_model <- lm(data = sim1a, y ~ x)

coef(linear_model) #this is the result from using lm() function

 #results are different using the two different measuring techniques. i'd trust linear model lm() more.


# q3 ----------------------------------------------------------------------

make_prediction <- function(a, data) {
        a[1] + data$x * a[2] + a[3] #3 parameters
}

sim1a <- tibble(
        x = rep(1:10, each = 3),
        y = x * 1.5 + 6 + rt(length(x), df = 2)
)

measure_distance <- function (mod, data) {
        diff <- data$y - make_prediction(mod, data)
        mean(abs(diff))
}

best <- optim(c(0,0,0), measure_distance, data = sim1a)

best$par

 #what i can think of is it's hard to visualise the possible models when you have 3 parameters. with 2 parameters you can use geom_point and have the 2 parameters as x and y
 #below is how you would visualise a model using two parameters

ggplot(models, aes(a1, a2)) +
        geom_point(data = filter(models, rank(dist) <=10), size = 4, color = "red") +
        geom_point(color = -dist)