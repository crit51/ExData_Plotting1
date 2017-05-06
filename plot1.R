download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

png("plot1.png", width=480, height=480)
with(hpc, hist(Global_active_power, col="red",
               main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

