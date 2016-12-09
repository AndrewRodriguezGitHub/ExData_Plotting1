# read csv with ; sep
power_cons_table <- read.csv("Data/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=FALSE)
# subset the table for two needed dates
subsetPCT <- subset(power_cons_table, Date=="1/2/2007" | Date=="2/2/2007")
# Date and Time
DateTimePCT <- strptime(paste(subsetPCT$Date, subsetPCT$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# plotting device for plot4
png("plot4.png", width=480, height=480)
# 2 rows and 2 columns
par(mfrow = c(2, 2)) 
# plot4 generation
plot(DateTimePCT, subsetPCT$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(DateTimePCT, subsetPCT$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DateTimePCT, as.numeric(subsetPCT$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(DateTimePCT, as.numeric(subsetPCT$Sub_metering_2), type="l", col="red")
lines(DateTimePCT, as.numeric(subsetPCT$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

plot(DateTimePCT, subsetPCT$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
# plotting device off plot4
dev.off()