#How have emissions from motor vehicle sources changed 
#from 1999–2008 in Baltimore City?
#

nei <-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")

#combine since there are so many sources
 nei2 <- subset(nei, fips == "24510" ) 
  nei_scc <- merge(nei2, scc, all.X =TRUE)

scc4 <-subset(nei_scc,  SCC.Level.Three %in% c(" Motor Vehicle Fires", "Motor Vehicles: SIC", "Motorcycles (MC)"))
#kept only those related to motor veh
 
  
#not much data, keep outliers
boxplot(Emissions~ year, scc4 ,main ="Baltimore Motor Vehicles", xlab = "Year", ylab = "Emissions (tons)")
dev.copy(png, file = "plot5.png") ## Copy my plot to a PNG file
dev.off() 

#looks like reduced 1999 to 2005, but up again in 2008
