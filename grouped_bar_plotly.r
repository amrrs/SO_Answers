df <- iris

p <- plotly::plot_ly()

colNames <- names(df)

colNames <- colNames[-which(colNames == 'Species')]


for(trace in colNames){
  p <- p %>% plotly::add_trace(data= df, x = ~ Species, y = as.formula(paste0("~`", trace, "`")), name = trace)
  
  print(paste0("~`", trace, "`"))
  
}

p
