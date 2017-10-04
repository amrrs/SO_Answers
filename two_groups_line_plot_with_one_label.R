library(reshape2)
library(ggplot2)

week1 <- c(6,3,1,2,8,7,5,10,4,9)
week2 <- c(3,2,1,4,9,10,5,8,6,7)

dat <- data.frame(week1, week2)
dat$team <- c("team a", "team b", "team c", "team d", "team e", "team f", "team g", "team h", 
              "team i", "team j")

a <- melt(dat, id.vars="team",
          measure.vars = grep("^week",names(dat),value=TRUE))

#a

ggplot(a, aes(x=variable, y=value,color=team)) +
  geom_point() +
  geom_line(aes(group = team)) + 
  scale_y_continuous(breaks = seq(1,10,1),trans = "reverse") + geom_text(aes(label=team), data = a[a$variable == 'week2',])
  geom_text(aes(label=team),hjust=-0.5)
  
