#Read in the data, select the desired dates and make a combined date and time variable in the POSIXct format

temp<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
data<-temp[temp$Date == "1/2/2007" | temp$Date == "2/2/2007",]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

#Open PNG device (default 480x480). Set 4 plots.
png(file="plot4.png")
par(mfrow=c(2,2))

#Plot 1 (copy plot 2 from earlier)

plot(data$DateTime,data$Global_active_power,pch="",ylab="Global Active Power (kilowatts)",xlab="")
lines(data$DateTime,data$Global_active_power)

#Plot 2 (same as first plot but using voltage)

plot(data$DateTime,data$Voltage,pch="",ylab="Voltage",xlab="datetime")
lines(data$DateTime,data$Voltage)

#Plot 3 (same as individual plot 3)

plot(data$DateTime,data$Sub_metering_1,pch="",ylab="Energy sub metering",xlab="")
points(data$Sub_metering_2,pch="")
points(data$Sub_metering_3,pch="")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",pch="",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

#Plot 4 (same as plot 2 but using Global reactive power)
plot(data$DateTime,data$Global_reactive_power,pch="",ylab="Global_reactive_power",xlab="datetime")
lines(data$DateTime,data$Global_reactive_power)

dev.off()