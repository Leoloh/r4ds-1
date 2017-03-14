library(tidyverse)

#q1
#' fill() only has 2 arguments: the data (data frame, or the column you want to be filled) and the direction
#' direction (q2) tells you the direction in which to fill missing values
#' complete() takes a set of columns and find unique combinations of the columns. it fills up the remaining column with available values and with NAs where necessary
#' spread() changes implicit missing values into explicit missing values by reorganising values of a column into headers for new columns and filling in the blanks (with NAs)