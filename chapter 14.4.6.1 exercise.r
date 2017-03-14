library(tidyverse)
library(stringr)

#q1
list <- c("apples, pears, and bananas")

list %>%
        str_split(boundary("word"))

#q2
#because splitting using " " also produces fragments such as "" (for newline) and words with punctuation eg "library."
#meanwhile using boundary("word") does not produce this undesirable side effects

#q3
list %>%
        str_split("")
#it splits the sentence into individual letters. this is equivalent to setting boundary("character")