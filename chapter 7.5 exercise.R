library(ggplot2)
library(dplyr)
library(nycflights13)

#7,5,2
#question 1
diamonds %>%
        count(color, cut) %>%
        ggplot() +
        geom_tile(aes (x = color, y = cut, fill = n))+
        scale_fill_continuous(limits = c(0, 5000), breaks = seq(0,5000, by =500))

#question 2
flights %>%
        group_by(dest, month) %>%
        summarise(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
        ggplot() +
        geom_tile (aes(x = dest, y = month, fill = avg_delay))
        
flights %>%
        group_by(dest, month) %>%
        summarise(avg_delay = mean(dep_delay, na.rm= TRUE)) %>%
        ggplot() +
        geom_jitter (aes(y = avg_delay, x = month, color = dest)) #this is better but not sure best

#question 3
ggplot(data = diamonds) +
        geom_count(mapping = aes(y = cut, x = color)) #this is better than swapping the x and y (apparently)

#7.5.3
#question 1
diamonds %>% #this solution is not right.
        ggplot(aes(x = price))+
        geom_freqpoly(aes(bins = cut_number(carat, 20), color = carat))

#question 2
diamonds %>%
        ggplot()+
        geom_boxplot(aes(x = price, y = carat, group = cut_width(price, 1500)), varwidth = TRUE)

#question 3
#large diamonds
diamonds %>% #price range is quite normally spread out for large diamonds
        filter(x > 10) %>%
        ggplot()+ 
        geom_boxplot(aes(x = price, y = x, group = cut_width(price, 500)), varwidth = TRUE)

#small diamonds
diamonds %>%
        filter(x < 2) %>% #very small diamonds can have very expensive prices. could be data entry error
        ggplot()+ 
        geom_boxplot(aes(x = price, y = x, group = cut_width(price, 500)), varwidth = TRUE)

#question 4
diamonds %>%
        ggplot()+
        geom_point(aes(x = carat, y = price, color = cut))

diamonds %>%
        ggplot(aes(x = carat))+ #this is not the best graph and can be improved
        geom_bin2d(aes( y = price, group = cut_width (carat, 0.2)))+
        geom_freqpoly(aes(color = cut), binwidth = 0.2)#maybe better if faceted by cut, instead of this layer

#question 5
ggplot(data = diamonds) +
        geom_point(mapping = aes(x = x, y = y)) +
        coord_cartesian(xlim = c(4, 11), ylim = c(4, 11))

ggplot(data = diamonds) +
        geom_boxplot(mapping = aes(x = x, y = y, group = cut_width(x, 0.4))) +
        coord_cartesian(xlim = c(4, 11), ylim = c(4, 11))
        #i think first graph is better because the overplotting is over a very small range of values

diamonds %>%
        ggplot()+
        geom_point(aes(x = log(carat), y = log(price)))

lm(log(price) ~ log(carat), data = diamonds)