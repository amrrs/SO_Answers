if(interactive()) {
  


## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      column(
      
      column(
        fluidRow(
          box(plotOutput("plot1"))
        ),
        fluidRow(
          box(plotOutput("plot2"))
        ),
        width = 10
      ),
      
      column(
        h3(
          textOutput('text1')
        ),
        width = 2
      ),
      width = 12
      )
      
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
  
    hist(histdata)
  })
  
  
  output$plot2 <- renderPlot({
    
    hist(histdata)
  })
  
  output$text1 <- renderText({
    "Uniform: These functions provide information about the uniform distribution on the interval from min to max. dunif gives the density, punif gives the distribution function qunif gives the quantile function and runif generates random deviates."
  })
  
  
  
}

shinyApp(ui, server)

}
