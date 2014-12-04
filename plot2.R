# clear console
cat("\014")  
#reading file
hp <- read.csv(file="household_power_consumption.txt", sep=";")
hp <- transform(hp, Global_active_power = as.numeric(levels(Global_active_power))[Global_active_power], Date = as.Date(Date, "%d/%m/%Y"))
#confining data to two days of Feb
hp <- subset(hp, Date >= as.Date("2007-02-01"))
hp <- subset(hp, Date <= as.Date("2007-02-02"))
#creating date-time obj
png(file ="plot2.png") 
dt <- as.POSIXct(paste(hp$Date, hp$Time), format="%Y-%m-%d %H:%M:%S")
plot(dt, hp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
dev.off()