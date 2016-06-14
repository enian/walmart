rm(list=ls())
pid19<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/1_9/DS/1_9.csv")
pid149<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/14_9/DS/14_9.csv")
pid1329<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/32_9/DS/32_9.csv")
pid1345<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/_3_45/DS/3_45.csv")
pid1645<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/_6_45/DS/6_45.csv")
pid11545<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/_15_45/DS/15_45.csv")

pid9<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/merge/9_merged.csv")
pid45<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/merge/45_merged.csv")
names(pid9)
name=pid149

# "date"         "pid"          "sid"          "units"        "volume_sales"
# "avgspeed"     "dewpoint"     "heat"         "resultdir"    "resultspeed" 
# "sealevel"     "station_nbr"  "stnpressure"  "tavg"         "tmax"        
# "tmin"         "wetbulb"
x<-pid45$unit
y<-pid45$heat
z<-pid45$dewpoint
plot(name$units,name$volume_sales)

x <- rnorm(500, mean=1, sd=5)
y <- rnorm(500, mean=5, sd=6.6)
z <- rnorm(500, mean=10, sd=3.3)
d <- data.frame(x,y,z)
boxplot(d) 
stripchart(d, vertical=TRUE, method="jitter", 
           add=TRUE, pch=16, col = rgb(0,0,0,0.5), cex=0.1)


install.packages('ggplotly')
library(ggplotly)
plot(pid19)
install.packages('plotly')
library(ggplot2)
library(plotly)

new<-pid45

plot_ly(data = pid45, x = heat, y = units, mode = "markers",
        color = volume_sales)


plot_ly(data = pid9, x = heat, y = units, mode = "markers",
        color = volume_sales)

plot_ly(d, x = carat, y = price, text = paste("Clarity: ", clarity),
        mode = "markers", color = carat, size = carat, opacity = carat)


plot_ly(data=pid45, x = wetbulb, y = units, text = paste("Clarity: ", volume_sales),
        mode = "markers", color = volume_sales, size = volume_sales, opacity = volume_sales)



p <- plot_ly(pid45, x = date, y = heat, name = "heat")
p %>% add_trace(y = fitted(loess(heat ~ as.numeric(date))), x = date)

library(plotly)


d <- pid45[sample(nrow(pid45), 1000), ]
# note how size is automatically scaled and added as hover text
plot_ly(d, x =sealevel , y = units, size =units, mode = "markers",color=volume_sales)


pid9_no<-read.csv("C:/Users/INSTALL/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/merge/9_merged_numbers_alone.csv")
# Libraries
library(ellipse)
install.packages('ellipse')
library(RColorBrewer)

# Use of the mtcars data proposed by R
data=cor(pid9_no)

# Build a Pannel of 100 colors with Rcolor Brewer
my_colors <- brewer.pal(5, "Spectral")
my_colors=colorRampPalette(my_colors)(100)

# Order the correlation matrix
ord <- order(data[1, ])
data_ord = data[ord, ord]
plotcorr(data_ord , col=my_colors[data_ord*50+50] , mar=c(1,1,1,1)  )







