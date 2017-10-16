

if(interactive()){
  
  library(shiny)
   
 UI =  shinyUI(fluidPage(theme = "bootstrap.css",
                    tags$script("setInterval(function(){
                                $('.nav').removeClass('active');//remove class active
},1000);"),
                  (navbarPage("B Version",
                              position = c("fixed-top"),
                              fluid=TRUE,
                              navbarMenu("Help", 
                                         tabPanel(
                                           a("Manual",
                                             target="_blank", href="Manual.pdf")
                                         ),
                                         tabPanel(
                                           a("Supporte",
                                             target="_blank", href="gpl.pdf")
                                         ),
                                         tabPanel(
                                           a("Tutorials",
                                             downloadLink("AbE", "Expression", class=" fa fa-cloud-download"),
                                             downloadLink("DiEx", "Expression", class=" fa fa-cloud-download")
                                           )
                                         )
                              ),
                              navbarMenu("Sample Data",
                                         tabPanel(
                                           downloadLink("AData", " Aff", class=" fa fa-cloud-download")
                                         ),
                                         tabPanel(
                                           downloadLink("CData", " Code", class=" fa fa-cloud-download")
                                         ),
                                         tabPanel(
                                           downloadLink("IData", " Il", class=" fa fa-cloud-download")
                                         )
                              ),
                              navbarMenu("Stand-Alone Version",
                                         tabPanel(
                                           downloadLink("CodeandData", " app", class=" fa fa-cloud-download")
                                         ),
                                         tabPanel(
                                           a("Stand-alone Manual",
                                             target = "_blank", href= "Stand-alone.pdf")
                                         )
                              )
                              
  )
  )
  )
  )

 SERVER = shinyServer(function(input, output,session) {
   
 })
 
 shinyApp(ui = UI, server = SERVER)
    
}

