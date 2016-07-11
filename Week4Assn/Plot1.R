SCC<-readRDS("Source_Classification_Code.rds")
NEI<-readRDS("summarySCC_PM25.rds")
emTotal<-aggregate(Emissions~year,data=NEI, FUN=sum)
emTotal$Mil=emTotal$Emissions/1000000
barplot(emTotal$Mil,names=emTotal$year,xlab="Years",ylab="PM2.5 Emissions(in Millions)", main="Total PM2.5 Emissions by Year")
reg<-lm(Mil~year,emTotal)
lmline<-reg$fitted.values
names(lmline)<-c("1999","2002","2005","2008")
lines(lmline,lwd=2,col="blue")
dev.copy(png,"plot1.png")
dev.off()