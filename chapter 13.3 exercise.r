library(tidyverse)
library(nycflights13)

#q1 add a surrogate key to flights

flights %>%
        count(year, month, day, tailnum) %>%
        filter(n > 1) #find out if this combination of variables form primary key for this tibble
        #turns out not. many rows with n > 1 (not unique)

flights %>%
        mutate(row = row_number()) %>%
        count(row) %>%
        filter(n >1)

#q2 identify the keys
library(Lahman)
library(babynames)
library(nasaweather)
library(fueleconomy)

Batting %>%
        count(playerID, yearID, stint) %>%
        filter(n>1)

babynames %>%
        count(name, year) %>% #don't run this piece of code, R will crash. maybe dataset too big.
        filter(n >1)

atmos %>%
        count(lat, long, year, month) %>%
        filter( n > 1)

vehicles %>%
        count(id) %>%
        filter (n > 1)

diamonds %>%
        mutate(row = row_number()) %>% #need to create surrogate key
        count(row) %>%
        filter(n >1)


#q3
Mastertb <- as_data_frame(Master)
Battingtb <- as_tibble(Batting)
Salariestb <- as_tibble(Salaries)
Managerstb <- as_tibble(Managers)
AwardsManagerstb <- as_tibble(AwardsManagers)