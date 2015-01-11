#Read in the data, select the desired dates and make a combined date and time variable in the POSIXct format

temp<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
data<-temp[temp$Date == "1/2/2007" | temp$Date == "2/2/2007",]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

#Open PNG device (default 480x480). Create an 'empty' plot of the date/time and global active power. Then add
#the addition metering points (but not shown) and lines representing each. 
# Add the legend for the lines and then close device.

png(file="plot3.png")

plot(data$DateTime,data$Sub_metering_1,pch="",ylab="Energy sub metering",xlab="")
points(data$Sub_metering_2,pch="")
points(data$Sub_metering_3,pch="")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",pch="",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)


dev.off()