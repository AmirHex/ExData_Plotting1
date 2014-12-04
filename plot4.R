# clear console
cat("\014")  
#reading file
hp <- read.csv(file="household_power_consumption.txt", sep=";")
hp <- transform(hp, Global_active_power = as.numeric(levels(Global_active_power))[Global_active_power], Date = as.Date(Date, "%d/%m/%Y"))
#confining data to two days of Feb
hp <- subset(hp, Date >= as.Date("2007-02-01"))
hp <- subset(hp, Date <= as.Date("2007-02-02"))
#creating date-time obj
dt <- as.POSIXct(paste(hp$Date, hp$Time), format="%Y-%m-%d %H:%M:%S")
#conversion to numeric values
hp <- transform(hp, Sub_metering_1= as.numeric(levels(Sub_metering_1))[Sub_metering_1], 
                Sub_metering_2 = as.numeric(levels(Sub_metering_2))[Sub_metering_2])
hp <- transform(hp, Global_reactive_power= as.numeric(levels(Global_reactive_power))[Global_reactive_power], 
                Voltage = as.numeric(levels(Voltage))[Voltage])
png(file="plot4.png")
par(mfrow=c(2,2))
plot(dt, hp$Global_active_power, type="l", xlab="", ylab="Global Active Power" )
plot(dt, hp$Voltage, type="l", xlab="datetime", ylab="Voltage" )
plot(dt, hp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
lines(dt, hp$Sub_metering_2, col="red")
lines(dt, hp$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col=c("black", "red", "blue"), bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dt, hp$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power" )
dev.off()
