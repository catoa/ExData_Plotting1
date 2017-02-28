source("helper.R")

power <- get_power_data()

png(file = "plot2.png", height = 480, width = 480)

plot(power$Timestamps, power$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
