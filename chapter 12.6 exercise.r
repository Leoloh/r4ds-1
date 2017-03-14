library(tidyverse)

who %>%
        gather(code, value, new_sp_m014:newrel_f65, na.rm = FALSE) %>%
        count(code) #produces 405440 values in total (56 * 7240), counting the NAs as well

who %>%
        gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>%
        count(code) #produces 76046 values in total (each code different value) because NAs were removed

#q1
#it's reasonable to remove the NA i think because NA might mean no survey was performed, while 0 means survey was conducted but no cases found.
#i think there is no implicit missing values in the table because the code variable was made into columns, forcing non-existent data to be inputted as NA

#q2
# you will end up with 2 types of newrel: 1 that is newrel, the other that is new_rel, even though they might point to the same thing

#q3
who %>%
        count(country, iso2, iso3)
#iso2 and iso3 were confirmed redundant with code above. number of rows remained the same as if you had done who%>%count(country) only
#if number of rows/observation increases (such as if you have done count(country, iso2, year)), then that means they are not redundant

#q4
#get warning message if you use separate() before the mutate() step because of "newrel"
tidywho <- who %>%
        select(-iso2, -iso3) %>%
        gather(code, value, new_sp_m014:newrel_f65) %>%
        separate(code, c("new", "var", "sexage"), sep = "_")
        
tidywho[304081,] #this is how you check one of the observations using row number shown in the warning

#below is the correct code
tidywho <- who %>%
        select(-iso2, -iso3) %>%
        gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% #you can use na.rm here
        mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
        separate(code, c("new", "var", "sexage"), sep = "_") %>%
        separate(sexage, c("sex", "age"), sep = 1)

tidywho %>%
        count(country, wt = value) %>% #wt is key here to perform sum calculation of a variable. if don't use 'wt', will only tally the number of rows
        arrange(desc(n)) %>%
        ggplot() +
        geom_point(aes(x = country, y = log(n)))

tidywho %>%
        count(year, wt = value) %>%
        arrange(desc(n)) %>%
        ggplot() +
        geom_point(aes(x = year, y = n))

tidywho %>%
        count(sex, wt = value) %>%
        arrange(desc(n)) %>%
        ggplot() +
        geom_point(aes(x = sex, y = n))

tidywho %>%
        group_by(sex) %>%
        summarise(cases = sum(value)) #or alternatively use group_by() and then summarise() to get the same effect as count(wt = variable)
