library(tidyverse)
library(modelr)
library(splines)

# q1 ----------------------------------------------------------------------

mod <- lm(y ~ x, data = sim2)

grid <- sim2 %>%
        data_grid(x) %>%
        add_predictions(mod)

grid

####

mod2 <- lm(y ~ 0 + x, data = sim2) #"0 +" is a way to create model without intercept, but not sure if it's really doing that under the hood or simply hiding it. see https://www.r-bloggers.com/be-careful-with-using-model-design-in-r/ 

grid2 <- sim2 %>%
        data_grid(x) %>%
        add_predictions(mod2)

grid2

### grid and grid2 produced same result. now this is fucking confusing. this is how to make code more concise

grid3 <- sim2 %>%
        data_grid (x) %>%
        gather_predictions(mod, mod2)

grid3


####
model_matrix(sim2, y ~ 0 + x)[1:40,] #formula becomes y = a_1 * xa + a_2 * xb + a_3 * xc + a_4 * xd
model_matrix(sim2, y ~ x)[1:40,] #formula becomes y = a_0 + a_1 * xa + a_2 * xb + a_3 * xc + a_4 * xd
#so the one with "0 +" shows xa column, while the other shows "intercept" column. also, the data is showing more correctly on the "0 +".
#prediction stays the same. print "grid3" if you want to see.


# q2 ----------------------------------------------------------------------

model_matrix(sim3, y ~ x1 * x2)
model_matrix(sim4, y ~ x1 * x2)

# * is good for interaction (whereas + is used if you want to only estimate the effect independent of all the others)
# * is a good symbol to use because it's intuitive (a0 + a1 * e1 + a2 * e2 + a12 * e1 * e2) --> you can tell easily which one is which. not the case with '+' symbol


# q3 ----------------------------------------------------------------------

sim3_matrix <- model_matrix(sim3, y ~ x1 + x2 + 0)

# mod1 <- lm(y ~ x1 + x2, data = sim3)

model1 <- function(a, data) {
        out <- a[1]
        for (i in 1:ncol(data)) {
                print(a[i-1])
                out <- out + (a[(i+1)] * data[[i]])
        }
        print(out)
}

model1(c(1,2,3,4,5,6), sim3_matrix)

y = a0 + a1 * x1 + a2[1:4] * x2[1:4]

# mod2 <- lm(y ~ x1 * x2, data = sim3)
y = a0 + a1 * x1 + a2 * x2 + a12 * x1 * x2

