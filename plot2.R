#
#
#

source("readdata.R")

consumption = readdata()

Sys.setlocale("LC_TIME", "C")

days = strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(days, consumption$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.off()
