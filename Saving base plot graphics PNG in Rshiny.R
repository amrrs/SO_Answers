library(shiny)
library(ggplot2)


# ui
ui <- fluidPage(
  downloadButton("save", "save")
)


# server
server <- function(input, output){
  
  p <- reactive({ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()})
  p2 <- reactive({dotchart(iris$Sepal.Length, iris$Species, iris$Species)})
  
  output$save <- downloadHandler(
    filename = "save.png" ,
    content = function(file) {
      #ggsave(p(), filename = file)
      png(file = file)
      p2()
      dev.off()
    })
}


# run
shinyApp(ui, server)