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
plot(subdata$datetime,subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()