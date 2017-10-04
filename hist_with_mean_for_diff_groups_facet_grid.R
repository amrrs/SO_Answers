
  library(ggplot2)
  library(plyr)
  data(midwest)
  
  nn <- ddply(midwest, "state", transform, 
        state_mean  = mean(percprof))

  
  ggplot(nn) +
  geom_histogram(aes(percprof, y=..density..),binwidth = 0.5, color = "white") + 
    geom_vline(aes(xintercept = state_mean),data=nn,linetype = 5) + facet_grid(state~.)  
  
