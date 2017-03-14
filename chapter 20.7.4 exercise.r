library(tidyverse)


# q1 ----------------------------------------------------------------------

hms::hms(3600) #prints 01:00:00

typeof(hms::hms(3600)) #primitive type = double

attributes(hms::hms(3600)) #attributes used = units (secs) and class (hms and difftime)


# q2 ----------------------------------------------------------------------

tibble_test <- tibble(x = 1:5, y = 6:1) #produces error "variables must be length 1 or 6. if you change y to 5:1, it works.

tibble_test


# q3 ----------------------------------------------------------------------

tb <- tibble(x = 1:5, y = list(5:1))

tb #no error is given, but if you put list(xyz) then the row output is a bit weird. they don't give the values you speficy but rather the type of vector and the length

