link <- 'http://quote.morningstar.com/etf-filing/Summary-Prospectus/2017/8/28/t.aspx?t=AGG&ft=497K&d=c6995d020ec0f1b3592873780a199bd1'
library(rvest)
library(magrittr)
link  %>%
  read_html() %>%
  html_nodes("iframe") %>%
  extract(4) %>%
  html_attr("src") %>% 
  read_html() %>%
  html_text() 
