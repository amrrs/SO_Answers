library(shiny)
library(colourpicker)

shinyApp(
  ui = fluidPage(
 
    sidebarPanel(
      splitLayout(
        colourInput("PlotThemeColour1",
                    "Plot theme shade 1",
                    "#C2C2C2"),
        colourInput("PlotThemeColour2",
                    "Plot theme shade 2",
                    "#E5E5E5"), cellArgs = list (style = "overflow:visible"))),
    mainPanel(textOutput("myCols"))
    ),
  
  server = function(input, output, session) {
    output$myCols <- renderText({
      paste(input$PlotThemeColour1, "and", input$PlotThemeColour2)
      
    })
  })
