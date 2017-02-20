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

#plot1
png("plot1.png", width=480, height=480)
with(df3, hist(Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red"))
dev.off()