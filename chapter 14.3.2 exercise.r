library(tidyverse)
library(stringr)

#q1
str_view("$^$", "\\$\\^\\$")

#q2
str_view(stringr::words, "^y", match = TRUE)
str_view(stringr::words, "x$", match = TRUE)
str_view(stringr::words, "^...$", match = TRUE)
str_view(stringr::words, ".......", match = TRUE)