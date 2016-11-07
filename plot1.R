fn <- "household_power_consumption.txt"
epc <- read.table(fn,sep = ";",header = TRUE)
epc[,"Date"] <- as.Date(epc[,"Date"],format = "%d/%m/%Y") 
epc <- subset(epc,as.Date(epc$Date)>="2007/2/1" & as.Date(epc$Date)<="2007/2/2")
epc[,"Global_active_power"] <- as.numeric(as.vector(epc[,"Global_active_power"]))
hist(epc$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
