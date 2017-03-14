library(tidyverse)
library(forcats)

as_tibble(gss_cat)

#q1
sumyear <- gss_cat %>%
        group_by(year) %>%
        summarise(sumyear = n()) #this creates a table with count of rows per year, to be used to calculate proportion

gss_cat %>%
        mutate(partyid = fct_collapse(partyid,
                                      other = c("No answer", "Don't know", "Other party"),
                                      rep = c("Strong republican", "Not str republican"),
                                      ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                                      dem = c("Not str democrat", "Strong democrat")
                                         )) %>%
        group_by(year) %>%
        count(partyid, year) %>%
        left_join(sumyear, by = "year") %>%
        mutate(prop = n/sumyear) %>%
        ggplot() +
        geom_line(aes(x = year, y = prop, color = partyid)) 

#q2
gss_cat %>%
        mutate(rincome = fct_collapse ( rincome,
                                        "No data" = c("Refused", "Not applicable", "Don't know", "No answer"),
                                        "$0 - 4999" = c("$3000 to 3999", "$1000 to 2999", "Lt $1000", "$4000 to 4999"),
                                        "$5000 - 9999" = c("$8000 to 9999", "$7000 to 7999", "$5000 to 5999", "$6000 to 6999")
                                        ))