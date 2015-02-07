##R Script to make the first plot

#Loading the data
setClass('myDate')
setAs("character","myDate", function(from) as.POSIXlt(from, format="%Y-%m-%d %H:%M:%S") )
col<-c('myDate','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
plotdata<-read.csv("plot.csv",header=TRUE,stringsAsFactors=FALSE,colClasses=col)


#Plotting the data
png(file = "plot1.png")
hist(plotdata$Global_active_power,main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)")
dev.off()