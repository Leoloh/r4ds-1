library(tidyverse)

#q1
stocks <- tibble(
        year   = c(2015, 2015, 2016, 2016),
        half  = c(   1,    2,     1,    2),
        return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
        spread(year, return, convert = TRUE) %>% #'convert' argument set to TRUE here won't produce any difference 
        gather("year", "return", `2015`:`2016`, convert = TRUE) #but will cause the 'year' column here to be 'int'-type

        #gather and spread not symmetrical because in spread you are replacing column name with values from observation. whereas in gather, you would need to specify new column names under where the values will be put
        #'convert' argument if set to TRUE will automatically run type.convert on the key column (in this case 'year'). This is useful if the column names are actually numeric, integer, or logical
        
#q2
table4a %>% 
        gather(1999, 2000, key = "year", value = "cases")
        #code fails because the non-syntactic column names were not wrapped in backticks (`)

#q3
people <- tribble(
        ~name,             ~key,    ~value,
        #-----------------|--------|------
        "Phillip Woods",   "age",       45,
        "Phillip Woods",   "height",   186,
        "Phillip Woods",   "age",       50,
        "Jessica Cordero", "age",       37,
        "Jessica Cordero", "height",   156
)

spread(people, key, value) #fails because obs 1 and 3 contains duplicate name with same key

#i was thinking of adding a column of another category to replace the current key. The keys will be similar but more specific, 'height', and 2 age categories -- 'age retiring', 'current age' or something like that

#q4
preg <- tribble(
        ~pregnant, ~male, ~female,
        "yes",     NA,    10,
        "no",      20,    12
)

preg %>%
        gather(male, female, key = 'gender', value = 'count')