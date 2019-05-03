file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


Requireddatetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(RequiredData$Sub_metering_1)
subMetering2 <- as.numeric(RequiredData$Sub_metering_2)
subMetering3 <- as.numeric(RequiredData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(Requireddatetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Requireddatetime, subMetering2, type="l", col="red")
lines(Requireddatetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()