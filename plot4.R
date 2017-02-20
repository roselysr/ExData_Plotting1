# Set english local time parameters
Sys.setlocale("LC_TIME", "us")

# Read data
df <- read.csv("./household_power_consumption.txt", sep = ";",  na.strings = "?");

# convert to date format
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# filter by date
library(dplyr)
df2 <- filter(df, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))

# add time column
df3 <- mutate(df2, DateTime = as.POSIXct(paste(df2$Date, df2$Time)))

#plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(df3, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Global Active Power")
  lines(DateTime, Sub_metering_2, col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n")
  plot(DateTime, Global_reactive_power, type = "l")
})
dev.off()