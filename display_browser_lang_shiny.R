#based on https://ryouready.wordpress.com/2013/11/20/sending-data-from-client-to-server-and-back-using-shiny/

jscode <- "var language =  window.navigator.userLanguage || window.navigator.language;
Shiny.onInputChange('mydata', language);
console.log(language);"

shinyApp(
  ui = fluidPage(
    useShinyjs(),

    "This is your browser language",
    textOutput('your_lang')

  ),
  server = function(input, output,session) {
    runjs(jscode)
 output$your_lang <- renderPrint(input$mydata)
  }
)
