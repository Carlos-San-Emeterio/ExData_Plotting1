##R Script to make the second plot

#Loading the data
setClass('myDate')
setAs("character","myDate", function(from) as.POSIXlt(from, format="%Y-%m-%d %H:%M:%S") )
col<-c('myDate','numeric','numeric','numeric','numeric','numeric','numeric','numeric')

plotdata<-read.csv("plot.csv",header=TRUE,stringsAsFactors=FALSE,colClasses=col)

#Plotting the data
png(file = "plot2.png")
plot(plotdata$DateTime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()