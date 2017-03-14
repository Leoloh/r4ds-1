library(tidyverse)
library(nycflights13)
library(lubridate)

#q1
ymd(c("2010-10-10", "bananas")) #got warning message "1 failed to parse"

#q2
#tzone specifies the timezone to put in the timestamp of today(). important because if you don't know which tz, you can only assume it's local tz and therefore prone to error. if the person coding intended it to be for specific tz, you might get time calculation error.

#q3
d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014

mdy(d1)
ymd(d2)
dmy(d3)
mdy(d4)
mdy(d5)


