# read csv with ; sep
power_cons_table <- read.csv("Data/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=FALSE)
# subset the table for two needed dates
subsetPCT <- subset(power_cons_table, Date=="1/2/2007" | Date=="2/2/2007")
# Date and Time
DateTimePCT <- strptime(paste(subsetPCT$Date, subsetPCT$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# plotting device for plot3
png("plot3.png", width=480, height=480)
# plot3 generation
plot(DateTimePCT, as.numeric(subsetPCT$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(DateTimePCT, as.numeric(subsetPCT$Sub_metering_2), type="l", col="red")
lines(DateTimePCT, as.numeric(subsetPCT$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# plotting device off plot3 
dev.off()