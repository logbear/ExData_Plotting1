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
png(filename="plot4.png") #, bg="transparent")
par(mfcol=c(2,2))

#first plot
plot(data$date.time, data$global.active.power, type="n",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data$date.time, data$global.active.power)

#second plot
plot(data$date.time, data$Sub_metering_1, type="n",
     ylab="Energy sub metering", xlab="")
lines(data$date.time, data$Sub_metering_1, col="black")
lines(data$date.time, data$Sub_metering_2, col="red")
lines(data$date.time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
       legend=c("Sub_metring_1", "Sub_metring_2", "Sub_metring_3"))

#third plot
plot(data$date.time, data$voltage, type="n",
     ylab="voltage", xlab="datetime")
lines(data$date.time, data$voltage)

#fourth plot
plot(data$date.time, data$global.reactive.power, type="n",
     ylab="Global_reactive_power", xlab="datetime")
lines(data$date.time, data$global.reactive.power)


dev.off()