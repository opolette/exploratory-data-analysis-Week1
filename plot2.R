options(warn=-1)
library(dplyr)
png(file="plot2.png")
# read csv and convert columns
epc <- read.csv("household_power_consumption.txt", sep=";")
epc$time = strptime(epc$Time, format="%H:%M:%S")
epc$Date = as.Date(as.character(epc$Date), "%d/%m/%Y")
epc$Global_active_power = as.numeric(as.character(epc$Global_active_power))
epc <- filter(epc, Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01"))
# draw plot
plot(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Global_active_power, col="black", xlab="", ylab="Global Active Power (kilowatts)", lty=1, type="n")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Global_active_power)
# generate png
dev.off()
options(warn=0)