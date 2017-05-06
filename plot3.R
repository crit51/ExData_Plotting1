if (!file.exists("household_power_consumption.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "household_power_consumption.zip")
}

if (!file.exists("household_power_consumption.txt")) {
  unzip("household_power_consumption.zip")
}

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

hpc$datetime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$datetime <- strptime(hpc$datetime, format="%d/%m/%Y %T")

#str(hpc)

png("plot3.png", width=480, height=480)
with(hpc, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(hpc, lines(datetime, Sub_metering_2, type="l", col="red"))
with(hpc, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

dev.off()

