library(tidyverse)

#q1
#use read_delim(file, delim ="|")

#q2
#col_names, col_types, na.... see ?read_delim for more info

#q3
#file, col_positions, col_types, na, skip

#q4
read_delim("x,y\n1,'a,b'", delim = ",", quote = "'")

#q5
read_csv("a,b\n1,2,3\n4,5,6") #rows differ in length. follows the header
read_csv("a,b,c\n1,2\n1,2,3,4") #missing value. need to specify how to handle it
read_csv("a,b\n\"1") #missing value
read_csv("a,b\n1,2\na,b") #i don't see anything wrong
read_csv("a;b\n1;3") #this is not comma-separated. need to use read_delim with (delim = ":")