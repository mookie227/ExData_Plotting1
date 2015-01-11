#Read in the data, select the desired dates and make a combined date and time variable in the POSIXct format

temp<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
data<-temp[temp$Date == "1/2/2007" | temp$Date == "2/2/2007",]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

#Open PNG device (default 480x480). Create an 'empty' plot of the date/time and global active power. Then add
#the lines representing the power consumption and then close device.

png(file="plot2.png")

plot(data$DateTime,data$Global_active_power,pch="",ylab="Global Active Power (kilowatts)",xlab="")
lines(data$DateTime,data$Global_active_power)

dev.off()
