fn <- "household_power_consumption.txt"
epc <- read.table(fn,sep = ";",header = TRUE)
epc[,"Date"] <- as.Date(epc[,"Date"],format = "%d/%m/%Y") 
epc <- subset(epc,as.Date(epc$Date)>="2007/2/1" & as.Date(epc$Date)<="2007/2/2")
epc[,"Global_active_power"] <- as.numeric(as.vector(epc[,"Global_active_power"]))
dt <- paste(epc$Date,epc$Time)
dt<-strptime(dt,format = "%Y-%m-%d %H:%M:%S")
epc<-cbind(epc,dt)
epc[,"Sub_metering_1"] <- as.numeric(as.vector(epc[,"Sub_metering_1"]))
epc[,"Sub_metering_2"] <- as.numeric(as.vector(epc[,"Sub_metering_2"]))
epc[,"Sub_metering_3"] <- as.numeric(as.vector(epc[,"Sub_metering_3"]))

par(mfrow= c(2,2))

plot(epc$dt,epc$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

plot(epc$dt,epc$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(epc$dt,epc$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering",col = "black")
lines(epc$dt,epc$Sub_metering_2,col="red")
lines(epc$dt,epc$Sub_metering_3,col="blue")
legend("topright",pch = 151,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(epc$dt,epc$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()
