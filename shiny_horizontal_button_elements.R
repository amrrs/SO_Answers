library(shiny)

shinyApp(
  ui = fluidPage(
    
    sidebarLayout(
      sidebarPanel(
        
        textInput("answer", width = "50px", label = "Answer"),
        
        fluidRow(  
          
                 
                 actionButton(inputId = "next_question", label = "Next"),
                 #display horizontal buttons/elements in shiny using display:inline-block
                 tags$div(textInput(inputId = "correct", label = "yup"), style = "display:inline-block") 
                 
        )
      ),
      
      mainPanel(
        # Equation
        textOutput("equation")
      ))),
  
  server = function(input, output, session){}
)
