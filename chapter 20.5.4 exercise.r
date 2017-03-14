library(tidyverse)


# q1 ----------------------------------------------------------------------

#draw on paper, not that difficult


# q2 ----------------------------------------------------------------------

diamonds[1][1]
diamonds[1] #both have same result, everything is still in a tibble column (picks the 1st column)

head(diamonds[[1]]) #a
diamonds[[1]][1] #b
diamonds[[1]][[1]] #c
 #a de-list the column, leaving you with non-tibble, but prints the whole 50k vector element
 #b and c delist the column, but prints only the first vector element.

#tibble is essentially a list in a list
diamonds[1,2] #first row, 2nd column
diamonds[1,] #prints the first row, all columns