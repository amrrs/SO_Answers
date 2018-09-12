
library(shiny)
library(tidyverse)
library(DT)

shinyApp(
  ui = fluidPage(
    
    sidebarLayout(
      sidebarPanel(
        fluidRow(  
          column(8,dataTableOutput("view"))
        )
      ),
      
      mainPanel(
      ))),
  
  server = function(input, output, session){
    
    correct <- reactiveValues(num = 7)
    wrong <- reactiveValues(num = 4)   
    skipped <- reactiveValues(num = 9)
    
    togo = 80
    
    output$view <- renderDataTable(datatable(tibble(
      Right = correct$num,
      Wrong = wrong$num,
      Skipped = skipped$num,
      ToGo = togo
    ), options = list(dom = 't')) %>% formatStyle("Right",color=styleEqual(7, "red")) )  #only the table with options 
  }
)
