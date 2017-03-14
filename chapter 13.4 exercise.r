library(tidyverse)
library(nycflights13)
library(maps)

#q1
avg_delay <- flights %>%
        group_by(dest) %>%
        summarise(avg_delay = mean(dep_delay, na.rm = TRUE))

airports %>%
        left_join(avg_delay, c('faa' = 'dest'))%>%
        arrange(desc(avg_delay)) %>%
        semi_join(flights, c("faa" = "dest")) %>%
        ggplot(aes(lon, lat, color = avg_delay)) +
        borders('state') +
        geom_point()+
        coord_quickmap()

#q2
flights %>%
        select(-dep_time:-arr_delay, -air_time:-time_hour) %>%
        left_join(airports, c ('origin' = 'faa')) %>% #variable.x
        left_join(airports, c ('dest' = "faa")) # %>% #variable.y
        #select(-name.x:-dst.x)

airports[which(airports$faa == "EWR"), ] #subsetting the data to check
airports[which(airports$faa == "IAH"), ]
subset(airports, faa == "EWR") #another way to subset

#q3
planes %>%
        count(!is.na(year)) #we have 70 NAs for year variable

planes %>%
        count(tailnum) %>%
        filter(n >1) #tailnum is the primary key

age <- planes %>%
        mutate(age = 2016-year) %>%
        count(!is.na(age))

flights %>%
        left_join(age, by = "tailnum") %>%
        select(tailnum, year.x, month, day, dep_delay, arr_delay, age) %>%
        ggplot()+
        geom_point(aes(x = age, y = dep_delay, alpha = 0.1))

#q4
flightweather <- flights %>%
        select(year:day, dep_delay, arr_delay, origin, hour) %>%
        left_join(weather) 
        
flightweather %>%
        ggplot() +
        geom_point(aes(x = dep_delay, y = humid)) #not really with humidity

flightweather %>%
        ggplot() +
        geom_point(aes(x = dep_delay, y = temp), color = 'blue') #not really with temperature either

flightweather %>%
        ggplot() +
        geom_point(aes(x = dep_delay, y = wind_speed), color = 'green') #not really with wind
        
flightweather %>%
        ggplot() +
        geom_point(aes(x = dep_delay, y = precip), color = 'green') #not precip

flightweather %>%
        ggplot() +
        geom_point(aes(x = dep_delay, y = pressure), color = 'green') #not this

flightweather %>%
        ggplot() +
        geom_point(aes(x = dep_delay, y = visib), color = 'green') #not visib either. don't know which one.

#q5
flights %>%
        subset(year == 2013 & month == 6 & day == 13) %>%
        arrange(dep_delay) %>%
        ggplot ()+
        geom_histogram(aes(x = dep_delay), binwidth = 1)