library(rvest)
library(V8)

link <- 'https://food.list.co.uk/place/22191-brewhemia-edinburgh/'

page <- read_html(link)

emailjs <- read_html(link) %>% html_nodes('li') %>% html_nodes('script') %>% html_text()

ct <- v8()

read_html(ct$eval(gsub('document.write','',emailjs))) %>% html_text()
