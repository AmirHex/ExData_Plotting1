# clear console
cat("\014")  
#reading file
hp <- read.csv(file="household_power_consumption.txt", sep=";")
hp <- transform(hp, Global_active_power = as.numeric(levels(Global_active_power))[Global_active_power], Date = as.Date(Date, "%d/%m/%Y"))
hp <- subset(hp, Date >= as.Date("2007-02-01"))
hp <- subset(hp, Date <= as.Date("2007-02-02"))
png(file ="plot1.png") 
hist(hp$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()