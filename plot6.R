#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
#

nei <-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")

#combine since there are so many sources
 nei2 <- subset(nei, fips %in% c( "24510" , "06037")) 
  nei_scc <- merge(nei2, scc, all.X =TRUE)

scc4 <-subset(nei_scc,  SCC.Level.Three %in% c(" Motor Vehicle Fires", "Motor Vehicles: SIC", "Motorcycles (MC)"))
#kept only those related to motor veh
 
  
par(mfrow=c(1,2))
with(subset(scc4 , fips == "24510"), plot(year, Emissions, col = "blue", main ="Baltimore",  ylab = "Emissions (tons)"))
with(subset(scc4 , fips != "24510"), plot(year, Emissions, col = "red", main ="Los Angeles",  ylab = "Emissions (tons)"))




dev.copy(png, file = "plot6.png") ## Copy my plot to a PNG file
dev.off() 

#based on the scale, LA is much higher

