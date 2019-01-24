library(tidyverse)
library(ggpmisc)

with_valley <- 
   ggplot_build(
     ggplot(wave, aes(seq_along(wave), wave)) + geom_line() +
  stat_valleys(aes(seq_along(wave), wave), span = 10) 
   )

values <- with_valley$data[[2]]

values[2,"xintercept"]-values[1,"xintercept"]
