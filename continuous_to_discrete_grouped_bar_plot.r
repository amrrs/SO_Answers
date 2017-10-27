library(plotly)
iris$iris_limits <- as.numeric(cut(iris$Sepal.Length,3))
p <- plot_ly(iris, x = ~iris_limits, y = ~Sepal.Length, type = 'bar', name = 
               'Sepal') %>%
  layout(yaxis = list(title = 'Count'), barmode = 'group')
p

