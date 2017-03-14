library(tidyverse)
library(stringr)

#q1
words[str_detect(words, "^a") & str_detect(words, "a$")]
words[str_detect(words, "^[aiueo]") & str_detect(words, "[^aiueo]$")]
words[str_detect(words, "a") & str_detect(words, "i") & str_detect(words, "u") & str_detect(words, "e") & str_detect(words, "o")]

#q2
df <- tibble(
        word = words,
        i = seq_along(word)
)

df %>%
        dplyr::filter(str_count(words, "[aiueo]") == max(str_count(words, "[aiueo]")))
#a few words have 5 vowels (max number of vowels in a word)

df %>%
        mutate(
                vowel = str_count(word, "[aiueo]"),
                length = str_length(word),
                vowelprop = vowel/length
        ) %>%
        arrange(desc(vowelprop)) %>%
        dplyr::filter(vowelprop > 0.7)