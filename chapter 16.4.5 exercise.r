library(tidyverse)
library(nycflights13)
library(lubridate)

#q1
#because probably there are too many variations in the duration of months. january, feb, march are all difference, for example. hard to put a number of seconds, without introducing errors

#q2
#days(overnight * 1) works to fix the overnight problem because it only has either TRUE or FALSE value. TRUE is coded as 1, therefore if it's an overnight flight, the formula would yield "1", which can be used to be added to the arrival date to fix the problem. the opposite for FALSE (codes for 0)

#q3 Create a vector of dates giving the first day of every month in 2015. Create a vector of dates giving the first day of every month in the current year.
firsts_2015 <- c(ymd("2015-01-01") + months(0:11))

this_year <- update(today(), month = 1, mday = 1)
firsts_this_year <- this_year + months(0:11)

#q4
bday <- ymd("1990-12-12")
my_age <- (bday %--% today()) %/% years(1)

#q5
(today() %--% (today() + years(1))) / months(1) #it works. not sure what he is talking about