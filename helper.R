require(data.table, quietly = T)
require(dplyr, quietly = T)

get_power_data <- function() {
    power <- suppressWarnings(fread("household_power_consumption.txt", 
                                    nrows = 2075259, 
                                    sep = ";", 
                                    header = TRUE))
    
    pattern <- "^(1/2/2007|2/2/2007)"
    power <- power[grep(pattern, power$Date), ]
    
    power$Weekday <- weekdays(as.Date(power$Date,'%d/%m/%Y'))
    power <- subset(power, power$Weekday %in% c("Thursday", "Friday", "Saturday"))
    
    power$Voltage <- as.numeric(power$Voltage)
    
    power$Global_active_power <- as.numeric(power$Global_active_power)
    
    power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
    
    power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
    power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
    power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
    
    datetimes <- paste(power$Date, power$Time, sep = " ")
    timestamps <- strptime(datetimes, "%d/%m/%Y %H:%M:%S")
    
    power <- cbind(power, as.POSIXct(timestamps))
    
    power <- rename(power, Timestamps = V2)
    
    return (power)
}