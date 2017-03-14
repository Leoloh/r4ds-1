library(tidyverse)
library(stringr)

#q1
regex <- "(the) ([A-z]+)" #replace (the) with (number) to find that there is 0 match

has_number <- sentences %>%
        str_subset(regex) %>%
        head(10)

str_view_all(has_number, regex)

#below is alternative with tibble to generate both the sentence and the match in the same tibble
tibble(sentence = sentences) %>%
        tidyr::extract(sentence, c("word", "number"), regex, remove = FALSE)

#q2
regex2 <- "([A-z]+)\\'([A-z]*)"

tibble(sentence = sentences) %>%
        tidyr::extract(
                sentence, c("before", "after"), regex2, remove = FALSE
        )
#the str_subset way
has_apostrophe <- str_subset(sentences, regex2)

str_view_all(has_apostrophe, regex2)