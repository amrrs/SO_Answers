library(shiny)
library(leaflet)
library(magrittr)

# create data
df<-data.frame(x=runif(10,20,21), y=runif(10,0,1))
df$aircraft[1:5] <- "C130"
df$aircraft[5:10] <- "B200"

# create map
map = leaflet() %>% addTiles()


# set up shiny app
ui <- bootstrapPage( tags$style(type = "text/css", "html, body {width:100%;height:100%}",
                                "
                                .leaflet-top .leaflet-control {
                                   margin: 0px;
                                }    

                                .leaflet-right {
                                     margin-right: 40px;
                                  }    
                                .full{
                                background-color: blue;
                                border-radius: 50%;
                                width: 20px;
                                height: 20px;
                                float: left;
                                 
                                }
                                .circle {
                                background-color: #FFF;
                                border: 3px solid blue;
                                border-radius: 50%;
                                height: 20px;
                                width: 20px;
                                 
                                }

                                .leaflet-control i{
                                  margin-right: 25px;
                                }
                                "),
                     leafletOutput("myMap"))



server <- function(input, output, session){
  
  df_c <- filter(df,df$aircraft == "C130")
  df_b <- filter(df,df$aircraft == "B200")
  
  output$myMap = renderLeaflet({map %>% 
      addCircleMarkers(df_c$x,df_c$y, radius=10, opacity = 1, fillColor = "white") %>%
      addCircleMarkers(df_b$x,df_b$y, radius=10, opacity = 1, fillOpacity = 1) %>%
      addLegend(colors = c("blue"), labels = c("B200"), className='full')  %>%
      addLegend(colors = c("white"), labels = c("C130"), className = 'circle')
    
  })
}

shinyApp(ui, server)