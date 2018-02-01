library(igraph)
library(magick)

n_of_vertices = 31
g = graph.tree(n_of_vertices, 2)
edge_labels = rep(c("Yes","No"), times=n_of_vertices/2)

fig <- image_graph(width = 600, height = 600, res = 96)
#img <- image_draw(frink)

plot(g,
     layout = layout.reingold.tilford(g, root=1),
     asp=0.5,
     vertex.shape="square",
     vertex.label=NA,
     vertex.size=6,
     vertex.color="black",
     vertex.frame.color="white",
     edge.width=3,
     edge.arrow.mode=0,
     edge.label=edge_labels,
     edge.label.family="sans",
     edge.label.color="black",
     edge.label.cex=0.75)

dev.off()

out <- fig %>% 
  image_annotate("Decision Tree", size = 20, color = "black",
                              degrees = 0, location = "+250+100") 


print(out)
