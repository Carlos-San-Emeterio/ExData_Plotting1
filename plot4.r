##R Script to make the forth plot

#Loading the data
setClass('myDate')
setAs("character","myDate", function(from) as.POSIXlt(from, format="%Y-%m-%d %H:%M:%S") )
col<-c('myDate','numeric','numeric','numeric','numeric','numeric','numeric','numeric')

plotdata<-read.csv("plot.csv",header=TRUE,stringsAsFactors=FALSE,colClasses=col)

#Plotting the data
png(file = "plot4.png")
par(mfrow=c(2,2))
plot(plotdata$DateTime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(plotdata$DateTime,plotdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(plotdata$DateTime,plotdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(plotdata$DateTime,plotdata$Sub_metering_2,col="red")
lines(plotdata$DateTime,plotdata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 0.75)
plot(plotdata$DateTime,plotdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_Reactive_Power")

dev.off()