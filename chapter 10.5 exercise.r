library(tidyverse)

#q1
class(mtcars)
class(as_tibble(mtcars))

#q2
df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[,c("abc", "xyz")]

df2 <- tibble(abc = 1, xyz = "a")
df2$x #-> this is where the difference lies as far as i can see. this gives error, in df no error.
df2[, "xyz"]
df2[,c("abc", "xyz")]

#q3
mtcars2 <- as_tibble(mtcars)
var <- "mpg"
mtcars2$var #doesn't work
mtcars2[[var]] #works

#q4
annoying <- tibble(
        `:)` = 1:10,
        `:(` = `:)` * 2 + rnorm(length(`:)`))
)

annoying[[':)']] #using backtick produces error. have to use normal tick to subset

ggplot(data = annoying) +
        geom_point(aes(x = annoying[[':)']], y = annoying[[':(']])) #just aes(x = ':)', y = ':(') won't work

annoying <-  mutate(annoying, `3` = annoying[[':(']] / annoying[[':)']])

rename(annoying, one = `:)`, two = `:(`, three = `3`)

#q5
#enframe convers named atomic vectors or lists to two-column data frames. for unnamed vectors, the natural
#sequence is used as name column

enframe(1:3)
enframe(c(a = 5, b = 7))

#q6
#option(tibble.width = Inf) -> shows all columns
#option(dplyr.print_min = Inf) -> shows all rows
