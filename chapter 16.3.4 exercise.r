library(tidyverse)
library(nycflights13)
library(lubridate)

make_datetime_100 <- function(year, month, day, time) {
        make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>%
        filter(!is.na(dep_time), !is.na(arr_time)) %>%
        mutate(
                dep_dttm = make_datetime_100(year, month, day, dep_time),
                arr_time = make_datetime_100(year, month, day, arr_time),
                sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
                sched_arr_time = make_datetime_100 (year, month, day, sched_arr_time),
                yday = yday(dep_dttm)
        ) %>%
        select(origin, dest, yday, dep_dttm, ends_with("delay"), ends_with("time"))

#q1
flights_dt %>%
        ggplot()+
        geom_boxplot(aes(x = yday, y = dep_time, group = cut_width(yday,10))) #this is every 10 days, but seems stable enough. if you don't use group every 10 days, result is difficult to read as boxplot is clumped together.
        
#q2
flights_dt %>%
        mutate(time_tally_or_not = sched_dep_time - dep_dttm + (dep_delay*60)) %>%#dep_time in the question is equiv to dep_dttm in my code
        #count(time_tally_or_not) %>% #if you activate this line and only run until this line, you'll see that 1205 rows had time_tally_or_not at 86400 secs, which translates to 1 day! if you run the whole code, you'll see that dep_delay*60 (to make dep_delay to secs) + diff (difference between scheduled and actual departure time, in secs) would all equal 86400. Why is this, not sure. could be data entry error. diff + dep_delay*60 should have been 0. 
        mutate(diff = sched_dep_time - dep_dttm) %>%
        filter(time_tally_or_not != 0) %>%
        select(dep_dttm, dep_delay, sched_dep_time, diff, time_tally_or_not) #explanation in the comment on count() row

#q3
flights_dt %>%
        mutate(duration_test = air_time - (arr_time - dep_dttm)) %>% #duration_test is the difference between reported air_time and the difference between reported arrival time and departure time
        select(arr_time, dep_dttm, air_time, duration_test, origin, dest) %>%
        arrange(duration_test) #result is really weird (duration_test shouldn't be higher than air_time) but it is because arrival time is BEFORE departure time --> quite possibly due to time difference between the airports, as airports normally report arrival and departures in local time. 
        group_by(origin, dest) %>%
        count()

#q4
flights_dt %>%
        mutate(sched_dep_hour = hour(sched_dep_time)) %>%
        group_by(sched_dep_hour) %>%
        summarise(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
        ggplot() +
        geom_bar(aes(x = sched_dep_hour, y = avg_delay), stat = "identity")
        #delay increases and day progresses and peaks at 7pm. should use sched_dep_time not dep_time to plot as dep_time already takes into account the delay (scheduled time + delay)

#q5
flights_dt %>%
        mutate(sched_dep_day = wday(sched_dep_time, label = TRUE)) %>%
        group_by(sched_dep_day) %>%
        summarise(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
        ggplot()+
        geom_bar(aes(x = sched_dep_day, y = avg_delay), stat = 'identity')
        #should leave on saturday if you want to minimise delay to as according to the graph, it has the least delay.

#q6
diamonds %>%
        filter(carat < 2.8) %>%
        ggplot()+
        geom_histogram(aes(carat))

ggplot(flights)+
        geom_histogram(aes(sched_dep_time))
        #the distribution is not similar...

#q7
flights_dt %>%
        mutate(delay_binary = ifelse(dep_delay > 0, "delay", "no delay/early")) %>%
        mutate(minute = minute(dep_dttm)) %>%
        group_by(minute) %>%
        ggplot() +
        geom_freqpoly(aes(x = minute, color = delay_binary )) 
        #this confirms the hypothesis that the early departures of flights in minutes 20-30 and 50-60 are caused by scheduled flights that leave early
        