file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


Requireddatetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(RequiredData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(Requireddatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()