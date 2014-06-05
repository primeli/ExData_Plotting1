library(sqldf)
data <-read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                    header = TRUE, sep = ";")
png(file = "plot4.png", bg = "transparent")
par(mfrow = c(2, 2))
# 1
plot(data$Global_active_power, type = "l" ,xaxt = "n",
xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1,c(0,0.5*max(length(data$Time)),max(length(data$Time))),c('Thu','Fri','Sat'))
# 2
plot(data$Voltage, type = "l" ,xaxt = "n",
xlab = "datetime", ylab = "Voltage")
axis(1,c(0,0.5*max(length(data$Time)),max(length(data$Time))),c('Thu','Fri','Sat'))
# 3
plot(data$Sub_metering_1, type = "l" ,xaxt = "n",
xlab = "", ylab = "Energy Sub metering")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(1,c(0,0.5*max(length(data$Time)),max(length(data$Time))),c('Thu','Fri','Sat'))
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n",
col = c("black", "red", "blue"), lty = c(1, 1, 1),lwd = c(2.5, 2.5, 2.5))
# 4
plot(data$Global_reactive_power, type = "l" ,xaxt = "n",
xlab = "datetime", ylab = "Global_reactive_power")
axis(1,c(0,0.5*max(length(data$Time)),max(length(data$Time))),c('Thu','Fri','Sat'))
dev.off()