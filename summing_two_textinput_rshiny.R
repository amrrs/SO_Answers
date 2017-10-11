## Arithmetic summing of two text box inputs
if (interactive()) {
  
  ui <- fluidPage(
    textInput("input1", "Input1", 1),
    textInput("input2", "Input2", 2),
    tags$h3('Result:'),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    output$value <- renderText({ as.numeric(input$input1) + as.numeric(input$input2)})
  }
  shinyApp(ui, server)
}
