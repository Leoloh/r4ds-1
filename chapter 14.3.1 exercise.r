library(tidyverse)
library(stringr)

#q1
#"\" as a string means it escapes "". Won't produce \ regex
#"\\" as a string means it escapes the 2nd '\', creating a regex of \, which escapes nothing and produces error
#"\\\" as a string means the first '\' escapes the 2nd '\' but the 3rd '\' escapes "". R will expect a character to escape, so it will wait for further instruction (gives you '+')
#"\\\\" first '\' escapes the 2nd '\'. 3rd '\' escapes the 4th '\'. You will create a regex \\, which means escaping the 2nd \. you matched a backlash!
backlash <- "law\\rence"
writeLines(backlash)

str_view(backlash, "\\\\")

#q2
seq <- "\"\'\\"
writeLines(seq)

str_view(seq, "\"\'\\\\")

#q3
#will match something like ".a.a.a"

alte <- ".a.a.a"
writeLines(alte)

str_view(alte, "\\..\\..\\..")
