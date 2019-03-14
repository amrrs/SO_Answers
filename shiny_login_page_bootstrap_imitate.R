library(shiny)
library(shinyWidgets)
library(fontawesome)



## Modifying inbuilt textInputAddon to accept password of shinyWidgets 

## blantantly copied: https://github.com/dreamRs/shinyWidgets/blob/master/R/utils.R
`%AND%` <- function (x, y) {
  if (!is.null(x) && !anyNA(x))
    if (!is.null(y) && !anyNA(y))
      return(y)
  return(NULL)
}

## blantantly copied: https://github.com/dreamRs/shinyWidgets/blob/master/R/input-textaddon.R

passwordInputAddon <- function (inputId, label, value = "", placeholder = NULL, addon, width = NULL)
{
  value <- shiny::restoreInput(id = inputId, default = value)
  htmltools::tags$div(
    class = "form-group shiny-input-container",
    label %AND% htmltools::tags$label(label, `for` = inputId),
    style = if (!is.null(width)) paste0("width: ", htmltools::validateCssUnit(width), ";"),
    htmltools::tags$div(
      style = "margin-bottom: 5px;", class="input-group",
      addon %AND% htmltools::tags$span(class="input-group-addon", addon),
      htmltools::tags$input(
        id = inputId, type = "password", class = "form-control",
        value = value, placeholder = placeholder
      )
    )
  )
}



ui <- shinyUI(
  fluidPage(
    tags$style(".container-fluid {margin-top: 20%}"),
    setBackgroundColor(color = "#29667a"),
    
      fluidRow(
        column(8, align = "center", offset = 2,
               textInputAddon("name", label = "", placeholder = "Username", addon = icon("user"),width = "45%"),
               tags$style(type="text/css", "#string { height: 50px; width: 100%; text-align:center;
                        font-size: 30px; display: block;}")
        )
      ),
      fluidRow(
        column(8, align = "center", offset = 2,
               passwordInputAddon("password", label = "", placeholder = "Password", addon = icon("key"),width = "45%"),               tags$style(type="text/css", "#string { height: 50px; width: 100%; text-align:center;
                        font-size: 30px; display: block;}")
        )
      ),
      fluidRow(
        column(6, align = "center", offset = 3,
               actionButton("login",label = "Login", width = "60%"))    ),
      fluidRow(
        column(6, align = "center", offset = 3,
               tags$div(HTML("<a href='https://www.github.com'> Forgot Password? </a>"))
        ))
    )
    
  
  
  
  
  
)

server <- function(input, output){
  
}

shinyApp(ui,server)
