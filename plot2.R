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
data$date.time = strptime(paste(data$date, data$time), "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", bg="transparent")
plot(data$date.time, data$global.active.power, type="n",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data$date.time, data$global.active.power)
dev.off()