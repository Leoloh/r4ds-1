library(tidyverse)
library(stringr)

#q1
str_view(stringr::words, "^[aiueo]", match = TRUE)
str_view(stringr::words, "^[^iaueo]", match = TRUE)
str_view(stringr::words, "[^e]ed$", match = TRUE)
str_view(stringr::words, "(ing|ise)$", match = TRUE)

#q2
str_view(stringr::words, "[^c]ie|[c]ei", match = TRUE)
str_view(stringr::words, "[c]ie|[^c]ei", match = TRUE) #these are the exceptions to the rule

#q3
str_view(stringr::words, "q[^u]", match = TRUE) #it appears q is always followed by u

#q4
str_view(stringr::words, "ise", match = TRUE)

#q5
str_view("+628551436321", "^\\+62", match = TRUE)