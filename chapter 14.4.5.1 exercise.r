library(tidyverse)
library(stringr)

#q1
backslash <- sentences %>%
        str_replace_all("\\/", "\\\\") %>%
        str_subset("\\\\")

str_view_all(backslash, "\\\\")
        #no sentences carry back or front slashes

#q2
sentences %>%
        str_replace_all(c("A" = "a", "B" = "b", "C" = "c", "D" = "d", "T" = "t")) %>%
        str_view_all("t")

#q3
sentences %>%
        str_replace_all("([A-z])([^ ]*)([a-z])", "\\3\\2\\1") %>%
        str_view_all("t")