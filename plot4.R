hpc <- read.table("C:\\Users\\SHJIN\\OneDrive\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc$datetime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$datetime <- strptime(hpc$datetime, format="%d/%m/%Y %T")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# plot 1
with(hpc, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# plot 2
with(hpc, plot(datetime, Voltage, type="l"))

# plot 3
with(hpc, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(hpc, lines(datetime, Sub_metering_2, type="l", col="red"))
with(hpc, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, bty="n", col=c("black", "red", "blue"))

# plot 4
with(hpc, plot(datetime, Global_reactive_power, type="l"))

dev.off()

