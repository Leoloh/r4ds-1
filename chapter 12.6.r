library(tidyverse)
who

who1 <- who %>%
        gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)

who1

who1 %>%
        count(key)

who2 <- who1 %>%
        mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

who3 <- who2 %>%
        separate(key, c("new", "type", "sexage"), sep = "_")

who3 %>%
        count(new) #no other value besides 'new' for this variable. to be removed in next step

who4 <- who3 %>%
        select(-new, -iso2, -iso3)

who5 <- who4 %>%
        separate(sexage, c("sex", "age"), sep = 1)

who5 #tidy data!!!

###################################################3
#everything in 1 pipeline

who %>%
        gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
        mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
        separate(code, c("new", "var", "sexage")) %>% 
        select(-new, -iso2, -iso3) %>% 
        separate(sexage, c("sex", "age"), sep = 1)
