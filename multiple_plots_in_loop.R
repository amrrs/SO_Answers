  library(gridExtra)
  library(ggplot2)
  
  out<-list()
  for (i in c(1,2,3)){
    print(i)
    
    out[[i]] <- qplot(1:100, rnorm(100), colour = runif(100))
                                    
    print(out[[i]])
    
    dev.off()
  }
  
  grid.arrange(out[[1]], out[[2]], out[[3]], nrow = 2)
