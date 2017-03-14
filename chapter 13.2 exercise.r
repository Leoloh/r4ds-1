library(tidyverse)
library(nycflights13)

#q1
#variables: planes$tailnum, flights$origin, flights$dest. tables = planes and flights

#q2
#weather connects to flights via origin, year, month, day, hour

#q3
#if it contained weather records for all airports in the USA, that means there will be "dest" additional relation with flights

#q4
#that could be 'special days' (xmas, easter, etc) data frame, with 'year', 'month', 'day', 'special day name', 'number of flyers'