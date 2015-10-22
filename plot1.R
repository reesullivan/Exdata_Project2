#Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for
# each of the years 1999, 2002, 2005, and 2008.


nei <-readRDS("summarySCC_PM25.rds")

par(mfrow=c(1,2))
with(nei, plot(year, Emissions ,xlab = "Year", ylab = "Emissions (tons)") )

#2002 has one very large outlier, remove it to clearly compare
boxplot(Emissions~ year, nei, xlab = "Year", ylab = "Emissions (tons)",  outline = FALSE )

#1999 has the largest median and max, except for the 2002 outlier

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() 