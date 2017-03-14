library(tidyverse)
library(stringr)

#q1. \1 is backreferencing, refering to the first letter. \2 is referencing to the 2nd letter
str_view("aaagsd", "(.)\\1\\1", match = TRUE) #matches the aaa
str_view(stringr::words, "(.)(.)\\2\\1", match = TRUE) #palindrome: anna, otto, illi
str_view(stringr::words, "(..)\\1", match = TRUE) # emem
str_view(stringr::words, "(.).\\1.\\1", match = TRUE) #eleve
str_view(stringr::words, "(.)(.)(.).*\\3\\2\\1", match = TRUE) #PARagRAP

#q2
str_view(stringr::words, "^(.).*\\1$", match = TRUE)
str_view(stringr::words, "(..).*\\1", match = TRUE)
str_view(stringr::words, "(.).*\\1.*\\1", match = TRUE)

df <- tibble(
        word = words, 
        i = seq_along(word)
)