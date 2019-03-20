library(dplyr)
DF = cbind.data.frame(A = c(1, 1, 2, 3, 3), 
                      B = c("a", "b", "a", "c", "c"), 
                      C = c("M", "N", "X", "M", "N"))


DFE = cbind.data.frame(A = c(1, 1, 2, 3), 
                       B = c("a", "b", "a", "c"), 
                       C = c("M", "N", "X", "M; N"))


DF %>% 
  group_by(A,B) %>% 
  summarise(C = paste(C, collapse = ";"))
#> # A tibble: 4 x 3
#> # Groups:   A [3]
#>       A B     C    
#>   <dbl> <fct> <chr>
#> 1     1 a     M    
#> 2     1 b     N    
#> 3     2 a     X    
#> 4     3 c     M;N
