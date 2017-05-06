hpc <- read.table("C:\\Users\\SHJIN\\OneDrive\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc$datetime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$datetime <- strptime(hpc$datetime, format="%d/%m/%Y %T")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

png("plot2.png", width=480, height=480)
with(hpc, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()

