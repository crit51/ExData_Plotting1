hpc <- read.table("C:\\Users\\SHJIN\\OneDrive\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

png("plot1.png", width=480, height=480)
with(hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",],
     hist(Global_active_power, col="red",
          main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

