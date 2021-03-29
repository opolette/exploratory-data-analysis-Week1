options(warn=-1)
library(dplyr)
# read csv and convert columns 
epc <- read.csv("household_power_consumption.txt", sep=";")
epc$time = strptime(epc$Time, format="%H:%M:%S")
epc$Date = as.Date(as.character(epc$Date), "%d/%m/%Y")
epc$Global_active_power = as.numeric(as.character(epc$Global_active_power))
epc$Voltage = as.numeric(as.character(epc$Voltage))
epc$Global_reactive_power = as.numeric(as.character(epc$Global_reactive_power))
epc <- filter(epc, Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01"))
png(file="plot4.png")
par(mfrow = c(2,2))
# Plot 1,1
plot(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Global_active_power, col="black", xlab="", ylab="Global Active Power (kilowatts)", lty=1, type="n")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Global_active_power)
# Plot 1,2
plot(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Voltage, col="black", xlab="datetime", ylab="Voltage", lty=1, type = "n")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Voltage, col="black")
# Plot 2,1
plot(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Sub_metering_1, col="blue", xlab="", ylab="Energy sub metering", lty=1, type="n")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Sub_metering_1, col="black")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Sub_metering_2, col="red")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Sub_metering_3, col="blue")
legend("topright", pch="__",  bty = "n",col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Plot 2,2
plot(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Global_reactive_power, col="black", xlab="datetime", ylab="Global_reactive_power", lty=1, type = "n")
lines(as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"),y=epc$Global_reactive_power, col="black")
# generate png
dev.off()
options(warn=0)