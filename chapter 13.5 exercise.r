library(tidyverse)
library(nycflights13)

#q1
tailnum_mismatch <- flights %>%
        anti_join(planes, by = "tailnum") %>%
        count(tailnum, sort = TRUE) #this finds out which tailnum in flights has no overlap/match in planes. 
                #output is tailnums from flights, not planes
                #that means some tailnums have no matching record in planes, what could be the reason?
                #what do these tailnums have in common?

filteredflights <- flights %>%
        semi_join(tailnum_mismatch) #create a new tibble where all rows only contain the mismatched tailnums

filteredflights %>%
        count(carrier, sort = TRUE) #candidates: carrier

flights %>%
        count(carrier, sort = TRUE) #comparison with original unfiltered carrier data showed that ~90% of mismatched tailnum comes from MQ and AA carriers.
        #>90% of MQ tailnums in flights have no match in planes.
        #~70% of AA tailnums in flights have no match in planes.

#q2 - filter flights to only show flights with planes that have flown at least 100 flights
more_than_100 <- flights %>%
        count(tailnum, sort = TRUE) %>%
        dplyr::filter(n > 99 & !is.na(tailnum) == TRUE)

flights %>%
        semi_join(more_than_100)

#q3 - Combine fueleconomy::vehicles and fueleconomy::common to find only the records for the most common models.
library(fueleconomy)

vehicles %>%
        semi_join(common)

#q4 - Find the 48 hours (over the course of the whole year) that have the worst delays. Cross-reference it with the weather data. Can you see any patterns?
flights %>%
        group_by(year, month, day) %>%
        summarise(delay = sum(dep_delay, na.rm = TRUE)) %>%
        mutate(delay_yest = lag(delay), delay_last48 = delay+delay_yest) %>%
        arrange(desc(delay_last48)) #worst 48 hours were between March 7 and March 8 at 84,713 min of total departure delay

weather_worst48 <- weather %>%
        subset(month == 3 & (day == 7 | day == 8))

weather_worst48%>%
        summary() #let's compare the averages first between weather data for the worst 48 hours vs the rest 
        
weather %>%
        anti_join(weather_worst48) %>%
        summary() #this is the rest

        #summary difference: visibility worse in worst48, wind_gust + wind_speed higher in worst48, humidity higher in worst48. 

#q5
#anti_join(x, y) will retain only the x tibble/columns, containing observations from x with no matching values in y

#q6
#hypothesis: 1 plane/tailnum = 1 airline/carrier

airlines %>%
        subset(select = carrier) %>%
        n_distinct() #all carrier observations in airlines df are unique

planes %>%
        count(tailnum) %>%
        dplyr::filter(n > 1) #all tailnum observations in planes df are unique

combination <- flights %>% #should put code to figure out where 1 tailnum is being used by >1 airline
        group_by(tailnum, carrier) %>%
        tally()

unfaithful_planes <- combination[(duplicated(combination[,1]) | duplicated(combination[,1], fromLast = TRUE)), ] #duplicated() finds duplicate but ignores the first occurrence, so you do another duplicated() this time from the bottom to identify the last occurrence but ignores the first occurrence 
        #HYPOTHESIS WRONG.  there are planes that were used by >1 carriers

unfaithful_planes %>%
        group_by(carrier) %>%
        count(carrier)

unfaithful_planes[!is.na(unfaithful_planes$tailnum),] #remove the NAs in tailnum
unfaithful_planes[complete.cases(unfaithful_planes[,1]),] #alternative way to remove all NAs in tailnum

View(unfaithful_planes)