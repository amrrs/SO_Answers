library(rvest)
library(V8)

link <- 'https://food.list.co.uk/place/22191-brewhemia-edinburgh/'
page <- read_html(link)
name_html <- html_nodes(page,'.placeHeading')
business_adr <- html_text(adr_html)
tel_html <- html_nodes(page,'.value')
business_tel <- html_text(tel_html)

emailjs <- page %>% html_nodes('li') %>% html_nodes('script') %>% html_text()
read_html(ct$eval(gsub('document.write','',emailjs))) %>% html_text()


