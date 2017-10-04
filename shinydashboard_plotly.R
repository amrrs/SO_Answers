## app.R ##
library(shiny)
library(plotly)
library(shinydashboard)
ui <- dashboardPage(
  dashboardHeader(title = "Zoom and Reset Dashboard",titleWidth = 290),
  dashboardSidebar(
    width = 0
  ),
  dashboardBody(
    # Creation of tabs and tabsetPanel
    tabsetPanel(type = "tab",
                tabPanel("Resource Dashboard", 
                         fluidRow(column(10,
                                         plotlyOutput("res_freq_plot")))),
                id= "tabselected"
    )
  ))
server <- function(input, output) 
{ 
  output$res_freq_plot <- renderPlotly(
    {
      plot_ly(iris, x= iris$Petal.Length,  y = iris$Sepal.Length)
    }
  )
}
shinyApp(ui, server)
