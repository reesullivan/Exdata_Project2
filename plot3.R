
#Of the four types of sources indicated by the type
# (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 
#1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

nei <-readRDS("summarySCC_PM25.rds")

#only Baltimore
nei2 <- subset(nei, fips == "24510")  # only baltimore

png(filename = "plot3.png", width = 480, height = 480, units ="px")
g <- ggplot(nei2, aes(year, Emissions))
print(g + geom_point() + facet_grid(.~type) + geom_smooth(method = "lm"))
dev.off()

#create a different plot for each type
#looks like non-point and point had decreases
#other 2 look more flat