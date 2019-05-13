library(highcharter)
#library(shinyjs)
library(shiny)
library(shinydashboard)

data_plot <- data.frame(categories = c("A", "B", "C", "D"),
                        serie1 = c(1563, 1458, 205, 695),
                        serie2 = c(562, 258, 17, 115),
                        serie3 = c(324, 654, 23, 987),
                        serie4 = c(123, 567, 234, 12),
                        serie5 = c(376, 88, 98, 123)
)

jsCode <- JS("function(event) {
if (!this.visible )
return false;

var seriesIndex = this.index;
var series = this.chart.series;

for (var i = 0; i < series.length; i++)
{
if (series[i].index != seriesIndex)
{
series[i].visible ?
  series[i].hide() :
  series[i].show();
} 
}
return false;
}")
  
  ui <- dashboardPage(
  
    
    dashboardHeader(title = "My Dashboard"),
    
    dashboardSidebar(),
    
    dashboardBody(  
    
      highchartOutput ("hc1")))
  
  server <- function(input, output,session) {
    
    #Normal Chart
    output$hc1 <- renderHighchart ({
      Hch <- highchart(hcaes(x = Spring ,y = Ponctuation)) %>% 
        hc_title(text = "Graph",
                 margin = 20, align = "left",
                 style = list(color = "#FE8000", useHTML = TRUE)) %>% 
        hc_xAxis(categories = data_plot$categories, title = list(text = "Number 
 of spring",color = "#FE8000")) %>%
        hc_yAxis(title = list(text = "Result", color = "#FE8000"))%>% 
        hc_add_series(name = 'serie1', data = data_plot$serie1) %>% 
        hc_add_series(name = 'serie2', data = data_plot$serie2)%>% 
        hc_add_series(name = 'serie3', data = data_plot$serie3)%>% 
        hc_add_series(name = 'serie4', data = data_plot$serie4)%>% 
        hc_add_series(name = 'serie5', data = data_plot$serie5) # %>% 
       # hc_plotOptions(series = list(events = list(legendItemClick = jsCode)))
      
      Hch})
    
    
  }
  
  
  shinyApp(ui, server)
