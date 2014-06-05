library(sqldf)
data <-read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                    header = TRUE, sep = ";")
png(file = "plot2.png", bg = "transparent")
plot(data$Global_active_power, type = "l" ,xaxt = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1,c(0,0.5*max(length(data$Time)),max(length(data$Time))),c('Thu','Fri','Sat'))
dev.off()