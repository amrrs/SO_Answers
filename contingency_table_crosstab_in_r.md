---
title: "Crosstab / Contingency Table in R"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Crosstab / Contingency Table in R

This is a simple R markdown explaining *xtabs* R function to build contigency table / crossta.

## Code


```{r}
df <- data.frame(Year = c(2011, 2012, 2013, 2011, 2012, 2013, 2011, 2012, 2013),
                 Country = c("England", "England", "England", "French", "French", "French", "Germany", "Germany", "Germany"), 
                 Pop = c(53.107, 53.493, 53.865, 63.070, 63.375, 63.697, 80.328, 80.524, 80.767)) 


#dcast(df, Pop + Country ~ Year)

xtabs(Pop ~ Country + as.factor(Year), df)
```



