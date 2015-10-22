#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999–2008?
#

nei <-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")
#head(scc)
#str(scc)

# use the SCC data set to find the Coal
# table(scc$EI.Sector)   =>   
#Fuel Comb - Electric Generation - Coal
#Fuel Comb - Comm/Institutional - Coal 
#Fuel Comb - Industrial Boilers, ICEs - Coal 


#use the scc$EI.Sector to identify those with Coal
#EI.Sector is a Factor
scc2 <- subset(scc, select = c(SCC, EI.Sector))

scc3 <-subset(scc2,  EI.Sector
%in% c("Fuel Comb - Electric Generation - Coal", "Fuel Comb - Comm/Institutional - Coal", "Fuel Comb - Industrial Boilers, ICEs - Coal" ) )

summary(scc3)
#the SCC levels are: 10100101    10100102   10100201

 nei3 <- subset(nei, SCC %in% c("10100101" ,   "10100102"  ,  "10100201")) 


#all years have some outliers
boxplot(Emissions~ year, nei3, xlab = "Year", ylab = "Emissions (tons)",  outline = FALSE )
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() 
