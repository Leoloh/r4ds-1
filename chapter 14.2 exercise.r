library(tidyverse)
library(stringr)

x <- "asdavsdf\\"
x #does not escape
writeLines(x) #escape the \

#q1
#paste and paste0 are very similar. paste0(..., collapse) is equivalent to paste(..., sep = "", collapse)
#paste and paste0 are equivalent to sub_c() in stringr
str_c("asd", "sdfg", NA) # produces NA (because NA is treated as contagious). use str_replace_na to convert NA to "NA"
paste('asf', "adfas", NA) #produces "asf adfas NA"

#q2
#looks very similar to me, i can't tell the difference

#q3
word <- "lawrence"

middle <- str_length(word)/2 + 1

str_sub(word, (middle), (middle))

#q4
writeLines(str_wrap("To learn regular expressions, we'll use str_view() and str_view_all(). These 
                   functions take a character vector and a regular expression, and show you how they 
                   match. We'll start with very simple regular expressions and then gradually get more 
                   and more complicated. Once you've mastered pattern matching, you'll learn how to apply 
                   those ideas with various stringr functions.", width = 80))

#it wraps the paragraph nicely. use it when you want to create somethng readable. but have to escape characters

#q5
str_trim("  String with trailing and leading white space\t"   )
#deletes all the whitespace before and after the string

#q6 -- UNSOLVED---------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
#----------------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
list <- "a", "b", "c"

str_c(str_sub(list, 1, str_length(list)-1))
