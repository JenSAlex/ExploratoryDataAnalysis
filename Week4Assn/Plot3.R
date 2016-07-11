library(ggplot2)
##Read Data
SCC<-readRDS("Source_Classification_Code.rds")
NEI<-readRDS("summarySCC_PM25.rds")
##Subset Data
baltMD<-subset(NEI,NEI$fips=="24510")

##Summarize Data
baltMDSum<-with(baltMD,tapply(Emissions,list(year,type),sum))

##convert matrix to dataframe
df_balt=data.frame(baltMDSum)
colnames(df_balt)<-c("year","type","Emissions")

##Plot
g<-ggplot(df_balt)
g+geom_bar(stat="identity",aes(x=year,weight=Emissions,fill=year))+geom_line(aes(x=as.numeric(year),y=Emissions),lwd=2)+facet_grid(.~type)
dev.copy(png,"plot3.png")
dev.off()
