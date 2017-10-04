data(iris)
library(ggplot2)
library(gridExtra)

grid.draw.arrangelist <- function(x, ...) {
  for(ii in seq_along(x)){
    if(ii>1) grid.newpage() 
    grid.draw(x[[ii]])
  }
}
box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") + ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4) 
box2 <- ggplot_build(box)
#I do stuff here
dev.off()
pdf.options(reset = TRUE)
pdf(file="test.pdf")
plot(ggplot_gtable(box2))
#ggsave("test1.png", plot = my_plot,dev = 'png')
plot(ggplot_gtable(box2))
dev.off()

p <- list()
p[[1]] <- ggplot_gtable(box2)
#p[[2]] <- ggplot_gtable(box2)
ggsave("test.pdf", arrangeGrob(grobs = p))


#pdf(file = "test1.pdf", onefile = F); for(i in 1:5){plot(rnorm(50, i, i), main = i)};dev.off()


pdf("myOut.pdf")
for (i in 1:10){
  plot(ggplot_gtable(box2))
}
dev.off()
