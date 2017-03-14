library(tidyverse)
library(stringr)

#q1
sentences %>%
        str_subset(regex("\\\\")) %>%
        str_view_all(regex("\\\\")) #no match, you can try to change both regexes arguments to "\\."

sentences %>%
        str_subset(fixed("\\")) #i don't know how to search for \ using fixed... maybe this is correct?

#q2
sentences %>%
        str_extract_all(boundary("word")) %>%
        tibble() #can't solve this problem, i need more techniques