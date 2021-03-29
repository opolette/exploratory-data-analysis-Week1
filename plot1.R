options(warn=-1)
library(dplyr)
png(file="plot1.png")
# read csv and convert columns
epc <- read.csv("household_power_consumption.txt", sep=";")
epc$time = strptime(epc$Time, format="%H:%M:%S")
epc$Date = as.Date(as.character(epc$Date), "%d/%m/%Y")
epc$Global_active_power = as.numeric(as.character(epc$Global_active_power))
epc <- filter(epc, Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01"))
# draw hist
hist(epc$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
# generate png
dev.off()
options(warn=0)