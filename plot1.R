# read csv with ; sep
power_cons_table <- read.csv("Data/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=FALSE, dec=".")
# subset the table for two needed dates
subsetPCT <- subset(power_cons_table, Date=="1/2/2007" | Date=="2/2/2007")
# plotting device
png("plot1.png", width=480, height=480)
# histogram of numeric data
hist(as.numeric(subsetPCT$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# plotting device off
dev.off()