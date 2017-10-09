df <- read.table(text = "user_id    date
1     1          20160602
2     1          20160603
3     1          20160604
4     1          20160605
5     1          20160606
6     1          20160712
7     1          20160909
8     1          20160910
9     1          20160911
10    1          20160912
11    1          20160913
12    6          20160121
13    6          20160122
14    6          20160123
15    6          20160221", header = T, stringsAsFactors = F)


#df$date <- strptime(df$date,format ='%Y%m%d') 

df$date <- lubridate::ymd(df$date)

newdf <- df %>% group_by(user_id) %>% mutate(days = date - lag(date, default = NA)) %>%  
  mutate(days = ifelse(is.na(days),0,days)) %>%
  mutate(flag = ifelse( days + lead(days, default = 0) > days + 1, 1, 0)) %>%
  filter(ifelse(flag + lag(flag, default = TRUE) == 2, FALSE, TRUE)) %>%
  select (user_id, date)

newdf

