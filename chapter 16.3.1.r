library(tidyverse)
library(nycflights13)
library(lubridate)

make_datetime_100 <- function(year, month, day, time) {
        make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>%
        filter(!is.na(dep_time), !is.na(arr_time)) %>%
        mutate(
                dep_time = make_datetime_100(year, month, day, dep_time),
                arr_time = make_datetime_100(year, month, day, arr_time),
                sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
                sched_arr_time = make_datetime_100 (year, month, day, sched_arr_time)
        ) %>%
        select(origin, dest, ends_with("delay"), ends_with("time"))

flights_dt %>%
        mutate(minute = minute(dep_time)) %>%
        group_by(minute) %>%
        summarise(
                avg_delay = mean(dep_delay, na.rm = TRUE),
                n = n()) %>%
        ggplot(aes(minute, avg_delay)) +
        geom_line() #flights leaving in minutes 20-30 and 50-60 have much lower delays than the rest of the hour. i think this might mean that flights were normally scheduled during round numbers (at around min 30 or 60) but since delayed, the actual departure times are as the chart outlined. 

flights_dt %>%
        mutate(minute = minute(sched_dep_time)) %>%
        group_by(minute) %>%
        summarise(
                avg_delay = mean(dep_delay, na.rm = TRUE),
                n = n()
        ) %>%
        ggplot(aes(minute, avg_delay))+
        geom_line() #scheduled dep time has no strong pattern against departure delay

flights_dt %>%
        mutate(dep_hour = update(dep_time, yday = 1)) %>%
        ggplot(aes(dep_hour)) +
        geom_freqpoly(binwidth = 300)