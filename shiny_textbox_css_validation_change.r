require(shiny)
require(shinyjs)
#install.packages("shinyjs")

ui = fluidPage( useShinyjs(),
                inlineCSS(list('.lightpink' = "background-color: lightpink",'.red'   = "background-color: red", "textarea" = 'text-align: center', '#text3 ' = 'text-align: center', '.form-control' = 'padding:10px; text-align: center;')),
                
                fluidRow(
                  column(3,numericInput("count", "No. of boxes",value = 3, min = 2, max = 10),actionButton("View","view")
                  )
                ),
                fluidRow(uiOutput("inputGroup")),
                fluidRow(column(3,wellPanel(textOutput("text3"))))
                
)

# takes in two arguments
sumN <- function(a, x){
  a <- sum(a, as.numeric(x),na.rm=T)
  return(a)
}

server <- function(input, output, session) {
  
  Widgets <- eventReactive(input$View,{ input_list <- lapply(1:(input$count),
                                                             function(i) {
                                                               inputName <- paste("id", i, sep = "")
                                                               textInputRow <- function (inputId,value) {
                                                                 textAreaInput(inputName,"", width = "200px", height = "43px", resize = "horizontal" )
                                                                 #numericInput(inputName,"",1,0,100)
                                                               }
                                                               column(4,textInputRow(inputName, "")) })
  do.call(tagList, input_list)},ignoreInit = T)
  
  output$inputGroup = renderUI({Widgets()})
  
  
  
  getvalues <- reactive({
    val <- 0
    for(lim in 1:input$count){
      observeEvent(input[[paste0("id",lim)]], { 
        updateTextAreaInput(session,paste0("id",lim), value = ({
          x =  as.numeric(input[[paste0("id",lim)]])
          if(!(is.numeric(x))){0}
          else if(!(is.null(x) || is.na(x))){
            if(x < 0){
              0 
            }else if(x > 100){
              100
            } else{
              return (isolate(input[[paste0("id",lim)]]))
            } 
          } 
          #else{0}
          else if((is.null(x) || is.na(x))){
            0
          } 
        })
        )
      })
      req(as.numeric(input[[paste0("id",lim)]]) >= 0 & as.numeric(input[[paste0("id",lim)]]) <= 100)
      val <- sumN(val,as.numeric(input[[paste0("id",lim)]]))
    }
    val
  })
  
  output$text3 <- renderText({
    #getvalues()
    # if(getvalues() > 100){
    #    0
    
    
    
    # }
    #else(getvalues())
    
    getvalues()
    
  })
  
  observeEvent(getvalues(), {
    
    nn <- getvalues()
    
    if(is.numeric(as.numeric(nn)) & !is.na(as.numeric(nn)) & nn == 100) {
      
      removeClass("text3", "red")
      addClass("text3","lightpink")          
      
    } else  { 
      
      addClass("text3","red")
      
    }
    
  })
  
  
}

shinyApp(ui=ui, server = server)
