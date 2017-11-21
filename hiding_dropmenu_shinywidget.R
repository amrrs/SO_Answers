library(shiny)
library(shinyWidgets)
library(shinyjs)

ui <- fluidPage(
  uiOutput('help')

)

server <- function(input, output) {
  observeEvent(
    input$button, {
      shinyjs::hideElement("dropdown-menu")


    }
  )
  output$help <- renderUI(dropdownButton(
    actionButton("button", "Press this Button to close the dropdownButton!"),
    circle = TRUE, status = "primary", icon = icon("user-circle")
  ) ) 

}

shinyApp(ui = ui, server = server)
