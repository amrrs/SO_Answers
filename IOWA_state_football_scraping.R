library(rvest)
library(stringr)
library(tidyr)

link <- "https://247sports.com/college/iowa-state/Season/2017-Football/Commits?sortby=rank"

link.scrap <- read_html(link)

names <- link.scrap %>% html_nodes('div.name') %>% html_text()

pos <- link.scrap %>% html_nodes('ul.metrics-list') %>% html_text() 

status <- link.scrap %>% html_nodes('div.right-content.right') %>% html_text() 

data <- data.frame(names,pos,status, stringsAsFactors = F)

data <- data[-1,]

head(data)
