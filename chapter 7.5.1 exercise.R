library(dplyr)
library(ggplot2)
library(nycflights13)
library(ggbeeswarm)

#question 7.5.1.1
with_cancelled <- flights %>%
        mutate(cancelled = is.na(dep_time),
               sched_hour = sched_dep_time %/% 100,
               sched_min = sched_dep_time %% 100,
               sched_dep_time = sched_hour + sched_min / 60)
        
        #bad graph because you can't see the changes in cancelled flights clearly
ggplot(with_cancelled) +
        geom_freqpoly(aes(x = sched_dep_time, color = cancelled), binwidth = 1/4)

        #good graph because now you can see what's happening by changing count to density
ggplot(with_cancelled)+
        geom_freqpoly(aes(x = sched_dep_time, color = cancelled, y = ..density..), binwidth = 1/4)

#question 2
filtered_mutated <- diamonds %>%
        mutate(size = x*y*z)%>%
        dplyr::filter(size <500, x >2.5, z > 2)

filtered_mutated %>%
        ggplot()+
        geom_point(aes(x = x, y = price, color = cut)) #table has 0 correlation, size is ok,
#depth no corr, carat has pretty good correlation until 1. x has the best correlation with price

filtered_mutated%>%
        ggplot()+
        geom_boxplot(aes(x = cut,y = x)) #fair diamonds more expensive because it's bigger on average

#question 3 cannot install ggstance

#question 4
library(lvplot)

filtered_mutated%>%
        ggplot()+
        geom_lv(aes(x = cut,y = price))

#question 6
ggplot2::qplot(class, hwy, data = ggplot2::mpg, geom='beeswarm')

distro <- data.frame(
        'variable'=rep(c('runif','rnorm'),each=100),
        'value'=c(runif(100, min=-3, max=3), rnorm(100))
)
ggplot2::qplot(variable, value, data = distro) +
        geom_beeswarm(priority='density',cex=2.5)
