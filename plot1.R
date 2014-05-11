library("graphics")

load.data <- function() {
    read.table("household_power_consumption.txt",
               sep=";", skip=66637, na.strings = "?", nrows=2880,
               col.names = c("date", "time", "global.active.power",
                             "global.reactive.power", "voltage", 
                             "global.intensity", "Sub_metering_1", 
                             "Sub_metering_2", "Sub_metering_3"))
}

data <- load.data()
png(filename="plot1.png", bg="transparent")
hist(data$global.active.power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()