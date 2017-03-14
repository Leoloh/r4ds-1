library(tidyverse)

#Compute the rate for table2, and table4a + table4b. You will need to perform four operations:
        
#1. Extract the number of TB cases per country per year.
#2. Extract the matching population per country per year.
#3. Divide cases by population, and multiply by 10000.
#4. Store back in the appropriate place.
#Which representation is easiest to work with? Which is hardest? Why?

table2 %>%
        arrange(type) %>%
        mutate(population = lead(count, n = 6L)) %>%
        rename(cases = count) %>%
        filter(type == 'cases') %>%
        select(1:2, 4:5) %>%
        mutate(rate = cases/population *10000) #or for easier solution, split one by one, then combine using left_join(df1, df2)
                        #even easier solution: use spread()

        #solution for table4a and 4b seems more difficult because you have to work individually on the two tables, before combining them together.

tidy4a1 <- table4a %>%
        select(country, `1999`) %>%
        mutate(year = '1999') %>%
        rename(cases = `1999`) 

tidy4a2 <- table4a %>%
        select(country, `2000`) %>%
        mutate(year = '2000') %>%
        rename(cases = `2000`)

full_join(tidy4a1, tidy4a2) #this is just for table4a, i'm not going to do table4b because steps are almost exactly the same

        #below here's an easier solution using gather()

tidy4a <- table4a %>%
        gather(`1999`, `2000`, key = "year", value = "cases")

tidy4b <- table4b %>%
        gather(`1999`, `2000`, key = 'year', value = 'population')

left_join(tidy4a, tidy4b)

#q2. Recreate the plot showing change in cases over time using table2 instead of table1. What do you 
#need to do first?

table2 %>%
        filter(type == "cases") %>%
        ggplot (aes(x = year, y = count)) +
        geom_line(aes(color = "grey50", group = country)) +
        geom_point(aes(color = country))