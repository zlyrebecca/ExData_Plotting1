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
plot(subdata$datetime,subdata$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(subdata$datetime,subdata$Sub_metering_2, type="l" ,col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, type="l" ,col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()