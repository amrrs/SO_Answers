  library(visNetwork)
  nodes <- data.frame(id = 1:4)
  #smooth - named list with required paramaters
  edges <- data.frame(from = c(2,4,3,2), to = c(1,2,4,3), label = 1:4, smooth = list(enabled = F, type ='curvedCW', roundness = 0.2))
  edges <- data.frame(edges,edges$from)
  
  #enable smooth for the edges you like
  
  edges$smooth.enabled[edges$label==1] = T
  edges$smooth.enabled[edges$label==3] = T
  visNetwork(nodes, edges, width = "100%") %>% 
    visEdges(arrows =list(to = list(enabled = TRUE, scaleFactor = 2)),
             color = list(color = "lightblue", highlight = "red")) %>% 
    visHierarchicalLayout()
  
