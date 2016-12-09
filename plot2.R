# read csv with ; sep
power_cons_table <- read.csv("Data/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=FALSE)
# subset the table for two needed dates
subsetPCT <- subset(power_cons_table, Date=="1/2/2007" | Date=="2/2/2007")
# plotting device for plot2
png("plot2.png", width=480, height=480)
# Date and Time
DateTimePCT <- strptime(paste(subsetPCT$Date, subsetPCT$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(DateTimePCT, as.numeric(subsetPCT$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
# plotting device off plot2
dev.off()

