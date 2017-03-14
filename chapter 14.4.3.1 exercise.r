library(tidyverse)
library(stringr)

#q1
colours <- c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c("\\b", str_c(colours, collapse = "|"))
has_colour <- str_subset(sentences, colour_match)
str_view_all(has_colour, colour_match)
more <- sentences[str_count(sentences, colour_match) > 1]
str_view_all(more, colour_match)


#q2
str_extract(sentences, "^[A-z]+")
str_view_all(str_subset(sentences, "ing\\b"), "ing\\b")
str_view_all(str_subset(sentences, "[A-z]{3}s\\b"), "[A-z]{3}s\\b")