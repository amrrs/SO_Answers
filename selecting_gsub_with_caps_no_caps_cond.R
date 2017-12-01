'''
responses <- c("The Himalaya", "The Americans", "A bird", "The Pacific ocean")
questions <- c("The highest mountain in the world","A cold war serie from 2013","A kiwi which is not a fruit", "Widest liquid area on earth")
df <- data.frame(cbind(questions,responses), stringsAsFactors = F)


I would like to do 2 things:

Remove the articles in first position in the responses column when adjacent to a word starting by a lower case letter
Remove the articles in first position in the responses column when (adjacent to a word starting by an upper case letter) AND IF (a geoword is in the corresponding question)
The expected result should be:

questions                           responses      
[1,] "The highest mountain in the world" "Himalaya"     
[2,] "A cold war serie from 2013"        "The Americans"
[3,] "A kiwi which is not a fruit"       "bird"         
[4,] "Widest liquid area on earth"       "Pacific ocean"


'''


responses <- c("The Himalaya", "The Americans", "A bird", "The Pacific ocean")
questions <- c("The highest mountain in the world","A cold war serie from 2013","A kiwi which is not a fruit", "Widest liquid area on earth")
df <- data.frame(cbind(questions,responses), stringsAsFactors = F)

df

articles <- c("The ","A ")
geowords <- c("mountain","liquid area")


df$f_caps <- unlist(lapply(df$responses, function(x) {grepl('[A-Z]',str_split(str_split(x,' ', simplify = T)[2],'',simplify = T)[1])}))
  

df$geoword_flag <- grepl(paste(geowords,collapse='|'),df[,1])


df$new_responses <- ifelse((df$f_caps & df$geoword_flag) | !df$f_caps, 
                     {gsub(paste(articles,collapse='|'),'', df$responses )  },
                     df$responses)

df$new_responses



