
# read the relevant subset of consumption data
source("readdata.R")
consumption = readdata()

Sys.setlocale("LC_TIME", "C")

days = strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(days, consumption$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.off()

# alternatively:
#datetime = paste(as.Date(consumption$Date), consumption$Time)
# and add a new column
#data$DateAndTime = as.POSIXct(datetime)
#
# with(consumption, {}
#   plot(Sub_metering_1 ~ DateAndTime)
# })