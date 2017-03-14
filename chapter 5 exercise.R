library(nycflights13)
library(dplyr)
library(ggplot2)

#5.6.7
#question 4
cancel_vs_delay <-  flights %>%
group_by(year, month, day) %>%
summarise(total_flights = n(), cancelled = mean(is.na(dep_time)),delay = mean(dep_delay, na.rm = TRUE)) %>%
        arrange(desc(cancelled))

cancel_vs_delay %>%
        dplyr::filter(cancelled <0.3, delay < 60)%>%
        ggplot() +
        geom_point(aes(x = cancelled, y = delay))

#question 5
flights %>%
        group_by(carrier)%>%
        summarise(mean_delay = sum(dep_delay, na.rm = TRUE)/n()) %>%
        arrange(desc(mean_delay)) #without taking into account the airports, it seems that F9 carrier
#has the most delay compared to other carriers. 

flights %>%
        group_by(dest) %>%
        summarise(mean_delay = sum(dep_delay, na.rm = TRUE)/n(), n_flights = n()) %>%
        arrange(desc(mean_delay)) #TUL airport has the most delays

        #taking into account both the airport and the carrier
with_airport <- flights %>%
        group_by(carrier, dest)%>%
        summarise(mean_delay = sum(dep_delay, na.rm = TRUE)/n(), delay = sum(dep_delay, na.rm = TRUE),
                  n_flights = n()) %>%
        dplyr::filter(n_flights >20)%>% #this is an important filtering: some permutations only have 1-2 sample sizes
        arrange(desc(mean_delay))

with_airport

with_airport %>% #this is not the best graph, but seems like EV carrier is the worst.
        ggplot()+
        geom_point(aes(x = carrier, y = mean_delay, color = dest, size = n_flights), stat = "identity")

flights %>%
        group_by(carrier, dest)%>%
        summarise(n_flights = n())

#question 6
flights %>%
        group_by()

##5.7.1 exercises
#question 2

flights %>%
        group_by(tailnum) %>%
        dplyr::filter(dep_delay > 0)%>%
        summarise(n_delayed = n()) %>%
        arrange(desc(n_delayed))

#question 3
flights %>%
        group_by(hour) %>%
        dplyr::filter(dep_delay > 0)%>%
        summarise(n_flights = n(), total_delay = sum(dep_delay, na.rm = TRUE), average_delay = total_delay/n())%>%
        arrange(average_delay) #fly at 5AM for shortest delays. 

flights %>%
        group_by(hour)%>%
        summarise(proportion_delay = mean(dep_delay > 0, na.rm = TRUE)) %>% #if dep_delay>0, returns 1, otherwise 0
        arrange(proportion_delay) #fly at 6AM to avoid delays. Has the least amount of delays

#question 4
next_delay <- flights %>%
        group_by(year, month, day, origin) %>%
        mutate(next_flight_time = lead(dep_time), next_flight_delay = lead(dep_delay))%>%
        dplyr::filter(dep_delay >0)%>%
        select(year:day, origin, dep_time, dep_delay, next_flight_time, next_flight_delay)%>%
        arrange(origin)

next_delay %>%
        group_by(origin) %>%
        summarise(proportion_next_delay = mean(next_flight_delay >0, na.rm = TRUE))
        # >50% of the delayed flights have the next flight delayed. need to compare this with the % of
        # delayed next flight if a flight is not delayed.

#question 5
flights %>%
        group_by(origin, dest) %>%
        dplyr::filter(!is.na(air_time))%>%
        
        
