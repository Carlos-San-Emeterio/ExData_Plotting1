##In this Rscript I will write a csv file that will only have 
##the data needed for the plots, and join Data and Time information 
##in one column. 

##In this file we asume that the working directory is the same directory   
##where data have been downloaded and unzipped.

col<-c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", 
                 stringsAsFactors=FALSE,colClasses=col,na.strings="?")
data$DateTime <- strptime(paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Subset the data
plotdata <- subset(data, format(DateTime,"%Y-%m-%d") == "2007-02-01" | format(DateTime,"%Y-%m-%d") == "2007-02-02", 
    select=c(DateTime,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3 ))
write.csv(plotdata,"plot.csv",row.names=FALSE)
rm(data,col,plotdata)