
#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland (fips == "24510") from 1999 to 2008
#Use the base plotting system to make a plot answering this question.

nei <-readRDS("summarySCC_PM25.rds")

nei2 <- subset(nei, fips == "24510")  # only baltimore

#outliers are not as large in scale, but still remove to compare
boxplot(Emissions~ year, nei2, xlab = "Year", ylab = "Emissions (tons)",  outline = FALSE )

#1999 still has the largest median and max


dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() 