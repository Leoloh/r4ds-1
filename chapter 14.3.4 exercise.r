library(tidyverse)
library(stringr)

#q1
#? = {0,1}
#+ = {1,}
#* = {0,}

#q2
# ^.*$ -> will match anything, any length
# "\\{.+\\}" -> regex is {.+}, will match strings encased in curly brackets
str_view("{asdf 8788a lashdfl7}", "\\{.+\\}", match = TRUE) 

#\d{4}-\d{2}-\d{2} -> will match 0000-00-00 (replace 0 with any digits)
str_view("1245-34-65", "\\d{4}-\\d{2}-\\d{2}")

#"\\\\{4}" -> will match "\\\\\\\\" string
str_view("\\\\\\\\", "\\\\{4}")

#q3
str_view("hhhaaaaugugug", "^[^aieuo]{3}[aieuo]{3,}([aiueo][^aiueo]){2,}", match = TRUE)

#q4 UNSOLVED