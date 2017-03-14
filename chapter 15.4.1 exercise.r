library(tidyverse)
library(forcats)

as_tibble(gss_cat)

#q1
gss_cat %>%
        group_by(relig) %>%
        summarise(
                age = mean(age, na.rm = TRUE),
                tvhours = mean(tvhours, na.rm = TRUE),
                n = n()
        ) %>%
        ggplot() +
        geom_point(aes(x = tvhours, y = fct_reorder(relig, tvhours)))
        #mean is not a good summary because it omits too much information. a better one would be to show boxplot

gss_cat %>%
        filter(!is.na(tvhours)) %>%
        ggplot() +
        geom_jitter(aes(y = tvhours, x = relig), alpha = 0.1, color = "green", width = 0.5)+
        geom_boxplot(aes(y = tvhours, x = relig), outlier.color = NA) +
        coord_flip()

#q2
gss_cat %>%
        count(marital) #arbitrary

gss_cat %>%
        count(race) #arbitrary

gss_cat %>%
        count(rincome) #principled

gss_cat %>%
        count(partyid) #principled

gss_cat %>%
        count(relig) #arbitrary

gss_cat %>%
        count(denom) #arbitrary

#q3
#because they count from the bottom?
