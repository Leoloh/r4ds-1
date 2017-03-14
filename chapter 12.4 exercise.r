library(tidyverse)

#q1
        #original:
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
        separate(x, c("one", "two", "three"))

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
        separate(x, c("one", "two", "three"))

        #with 'extra' and 'fill' changed:
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
        separate(x, c("one", "two", "three"), extra = "merge")

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
        separate(x, c("one", "two", "three"), fill = "left")

#q2
#'remove' will remove the original column(s). Set to FALSE if you don't want them removed

#q3
