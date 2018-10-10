library(shiny)
library(data.table)
library(rhandsontable)

#answer references: https://stackoverflow.com/questions/33722757/update-handsontable-by-editing-table-and-or-eventreactive#33739317


#question: https://stackoverflow.com/questions/52729853/user-input-in-datatable-used-for-recalculation-and-update-of-column-in-shiny

DF = data.frame(num = 1:10, qty = rep(0,10), total = 1:10,
                stringsAsFactors = FALSE)
#DF = rbind(DF, c(0,0,0))

ui = fluidPage(
  titlePanel("Reactive Table "),
  fluidRow(box(rHandsontableOutput("table", height = 400)))  
)
server = function(input, output) {
 
  data <- reactiveValues(df=DF)
  
  
  
  observe({
    input$recalc
    data$df <- as.data.frame(DF)
  })
  
  observe({
    if(!is.null(input$table))
      data$df <- hot_to_r(input$table)
  })
  
  
  output$table <- renderRHandsontable({
    rhandsontable(data$df)
  })
  
  
 
  
  output$table <- renderRHandsontable({
   
      data$df$total       <- data$df$num * data$df$qty
      print(sum(data$df$num*data$df$price) )
 
    rhandsontable(data$df, selectCallback = TRUE) 
  })
   
  
}
shinyApp(ui, server)
