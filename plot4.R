source("helper.R")

power <- get_power_data()


png(file = "plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))

plot(power$Timestamps, power$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(power$Timestamps, power$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

plot(power$Timestamps, power$Sub_metering_1, 
     type = "l", xlab = "",
     ylim = c(0, 38),
     ylab = "Energy sub metering")

points(power$Timestamps, power$Sub_metering_2, type = "l", 
       xlab = "", col = "red")

points(power$Timestamps, power$Sub_metering_3, type = "l", 
       xlab = "", col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), 
       lty = 1,
       bty = "n")

plot(power$Timestamps, power$Global_reactive_power,
     type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()