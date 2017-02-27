convert_numeric <- function(character_col) {
    return (suppressWarnings(as.numeric(character_col)))
}

power <- suppressWarnings(fread("household_power_consumption.txt", nrows = 2075259, stringsAsFactors = FALSE))
# Regex: date is either Feb 1st or Feb 2nd
pattern <- "^(1/2/2007|2/2/2007)"
power_sub <- power[grep(pattern, power$Date), ]

power_sub$Global_active_power <- convert_numeric(power_sub$Global_active_power)

png("plot1.png", width = 500, height = 500)

hist(power_sub$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     main = "Global Active Power")

dev.off()
