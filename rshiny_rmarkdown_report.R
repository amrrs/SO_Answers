library(shiny)
ui <- fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", label = (" Choose Data "),multiple = F),
      actionButton("button", "Calculate Mean",style = "background-color : skyblue", 
                   
                   icon = icon("stats", lib = "glyphicon"),width = 250 )
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("avg", placeholder = TRUE),
      
      downloadButton("reportpdf", label = 'Download Report', 
                     style = "background-color : orange", width = 250)
      
    )
  )
)


server <- function(input, output) {
  
  dataframe <- reactive( {
    
    ###  Create a data frame reading data file to be used by other functions..
    inFile <- input$file1
    
    print(inFile)
    
    read.csv(inFile$datapath, header = T)
    
    #print(data)
    
    
  })
  
  avg <- eventReactive(input$button,{mean(as.matrix(dataframe()))})
  
  output$avg <- renderText({avg()})
  
  output$reportpdf <- downloadHandler(
    filename = function() {
      paste('my-report', sep = '.', 'html')
    },
    
    
    content = function(file) {
      src <- normalizePath('Report.Rmd')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'Report.Rmd', overwrite = TRUE)
      
      library(rmarkdown)
      
      params <- list(mean = avg())
      out <- render('Report.Rmd', params = params)
      file.rename(out, file)
    }
  )
  
}

shinyApp(ui = ui, server = server)


###Report.Rmd

'''

---
title: " Analysis Report"
output: html_document
---
##Analysis Result
Percentage of data points spread: 
```{r} 
params$mean
```


'''
