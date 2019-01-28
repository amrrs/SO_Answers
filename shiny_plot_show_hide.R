library(shiny)
library(shinyjs)

ui <- fluidPage( shinyjs::useShinyjs(),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "number",
                  label = "Pick a number",
                  min = 6,
                  max = 12,
                  value = 8),
      actionButton("new_data",
                   "New data"),
      actionButton("show_plot",
                   "Show plot")
    ),
    mainPanel(
      tableOutput("char_table"),
      plotOutput(outputId = "car_plot")
      
    )
  )
)

server <- function(input, output) {
  
  t <- eventReactive(input$new_data, {
    hide("car_plot")
    r <- input$number
    c <- r - 1
    mat <- matrix(sample(0:1,r*c, replace=TRUE),r,c)
  })
  
  output$char_table <- renderTable({
    t()
  })
  
  observeEvent(input$show_plot, {
    show("car_plot")
  })
  output$car_plot <- renderPlot({
    plot(cars)
  })
}

shinyApp(ui = ui, server = server)
