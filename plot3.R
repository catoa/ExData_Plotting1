source("helper.R");

power <- get_power_data()

png(file = "plot3.png", height = 480, width = 480)

plot(power$Timestamps, power$Sub_metering_1, type="l", xlab="",
     ylim = c(0, 38),
     ylab="Energy sub metering")

points(power$Timestamps, power$Sub_metering_2, type = "l", 
       xlab = "", col = "red")

points(power$Timestamps, power$Sub_metering_3, type = "l", 
       xlab = "", col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), 
       lty = 1,
       cex = 0.65)

dev.off()

