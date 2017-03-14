library(tidyverse)
library(modelr)


# q1 ----------------------------------------------------------------------

grid <- sim1 %>%
        data_grid(x)

# sim1_mod <- lm(y ~ x, data = sim1)
sim1_mod <- loess(y ~ x, data = sim1)

grid <- grid %>%
        add_predictions(sim1_mod)

ggplot(sim1, aes(x)) +
        geom_point(aes(y = y)) +
        geom_line(aes(y = pred), data = grid, color = "red") #the result is not straight line like lm(), but wavy

ggplot(sim1, aes(x)) +
        geom_point(aes(y = y)) +
        geom_smooth(aes(y = pred), data = grid, color = "red") #is this what they want? same result.


# q2 ----------------------------------------------------------------------

#all 3 make predictions and add them to a data frame

#add_predictions() takes single model
#gather_predictions() takes multiple models. adds 1 column for each model (adds each prediction as a row)
#spread_predictions() takes multiple models. adds 2 columns (.model and .pred) for each model (adds each prediction to a new column)


# q3 ----------------------------------------------------------------------

#geom_ref_line() is from modelr package. it adds a reference line to ggplot graph.
#i guess it's important because it adds prominence to the reference line, drawing attention to there


# q4 ----------------------------------------------------------------------
#this below is how you look at frequency polygon of absolute (?) residuals
sim1_mod <- lm(y ~ x, data = sim1)

sim1 <- sim1 %>%
        add_residuals(sim1_mod) #to get residuals, you need both the x and y, unlike add_predictions()

ggplot(data = sim1, aes(resid)) +
        geom_freqpoly(binwidth = 0.5)

#this below is how you would look at raw residual values
ggplot(sim1, aes(resid, x)) +
        geom_ref_line(v = 0) +
        geom_point()

#freq poly of absolute (?) residuals helps us see quickly how far away are the predictions from observed value.
#the better quality models will have residuals that are closer to zero.

#the cons: you don't know where exactly are the points, as they are 'binned'. you can't tell what the residual data looks like
#if residual data looks like random noise, your model has done a good job capturing the patterns.