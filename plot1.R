
#Read in the data and select the desired dates

temp<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
data<-temp[temp$Date == "1/2/2007" | temp$Date == "2/2/2007",]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 


#Open PNG device (default size is the required 480x480) and plot the histrogram of Global Active Power
#Close the PNG device

png(file="plot1.png")

hist(data$Global_active_power,main="Global Active Power",col="red",
     xlab="Global Active Power (kilowatts)")

dev.off()
