require(data.table); require(dplyr);

power <- suppressWarnings(fread("household_power_consumption.txt", 
                                select = c(1,2,3),
                                nrows = 2075259, 
                                sep = ";", 
                                header = TRUE))

pattern <- "^(1/2/2007|2/2/2007)"
power <- power[grep(pattern, power$Date), ]

power$Weekday <- weekdays(as.Date(power$Date,'%d/%m/%Y'))
power$Global_active_power <- as.numeric(power$Global_active_power)
weekday_sub <- subset(power, power$Weekday %in% c("Thursday", "Friday", "Saturday"))

datetimes <- paste(power$Date, power$Time, sep = " ")
timestamps <- strptime(datetimes, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", height = 480, width = 480)
plot(timestamps, weekday_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
