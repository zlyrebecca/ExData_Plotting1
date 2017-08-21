#read file
file <- "/Users/beccazhang/Desktop/Course/DS_4/datasets/household_power_consumption.txt"
elecPower <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                        dec = ".", na.strings = "?")
#subset file
library("dplyr")
subdata <- filter(elecPower, Date == "1/2/2007" | Date == "2/2/2007")
rm(elecPower)
#convert to date-time format
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plot
par(mfrow=c(2,2), mai=c(0.8,0.8,0.1,0.1),oma=c(0,0,2,0))
plot(subdata$datetime,subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(subdata$datetime,subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subdata$datetime,subdata$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(subdata$datetime,subdata$Sub_metering_2, type="l" ,col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, type="l" ,col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), cex = 0.5)
plot(subdata$datetime,subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()