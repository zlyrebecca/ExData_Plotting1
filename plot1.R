#read file
file <- "/Users/beccazhang/Desktop/Course/DS_4/datasets/household_power_consumption.txt"
elecPower <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                        dec = ".", na.strings = "?")
#subset file
library("dplyr")
subdata <- filter(elecPower, Date == "1/2/2007" | Date == "2/2/2007")
rm(elecPower)
#hisogram
hist(subdata$Global_active_power, main = "Global Active Power", 
     xlab ="Glabal Active Power (kilowatts)", 
     ylab = "Frequency", col = "Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()