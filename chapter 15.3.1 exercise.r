library(tidyverse)
library(forcats)

as_tibble(gss_cat)

#q1
gss_cat %>%
        ggplot() +
        geom_bar(aes(rincome))
 #default graph difficult to read because there are too many categories, with many categories having little counts
 # also, there are many overlaps between the texts so it's impossible to read. improved plot below

gss_cat %>%
        ggplot() +
        geom_bar(aes(rincome))+
        coord_flip() #flip the x and y axis so no label overlap. clean and readable

#q2
gss_cat %>%
        count(relig) %>%
        arrange(desc(n))

gss_cat %>%
        count(partyid) %>%
        arrange(desc(n))

#q3
gss_cat %>%
        filter(denom != "Not applicable") %>%
        count(relig, denom) %>%
        arrange(desc(n)) %>%
        View()

gss_cat %>%
        filter(denom != "Not applicable") %>%
        ggplot() +
        geom_bar(aes(relig, fill = denom), position = "stack")
        
