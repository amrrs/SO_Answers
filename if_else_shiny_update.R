init <- "first text"

ui <- shinyUI(
  pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
      actionButton("reset", "Reset"),
      checkboxInput("test", "Test", FALSE)
    ),
    mainPanel(
      aceEditor(
        outputId = "ace",
        value = init
      )
    )
  )
)

server <- shinyServer(function(input, output, session) {

  observe({
    cat(input$ace, "\n")
     print(input$test)
  })

  observe({
    if(input$test){
      updateAceEditor(session, "ace", value = "Second text")
      } else {
      updateAceEditor(session, "ace", value = init)
    }})

  observeEvent(input$reset, {
    updateAceEditor(session, "ace", value = init)
   })

  })

shinyApp(ui = ui, server = server)
