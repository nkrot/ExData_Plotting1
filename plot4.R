
# read the relevant subset of consumption data
source("readdata.R")
consumption = readdata()

Sys.setlocale("LC_TIME", "C")

datetime = strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow = c(2,2))

with(consumption, {

  # 1
  plot(datetime, Global_active_power,
     xlab = "", ylab = "Global Active Power",
     type = "l")

  # 2
  plot(datetime, Voltage,
     xlab = "datetime", ylab = "Voltage",
     type = "l")

  # 3
  plot(datetime, Sub_metering_1, type = "n",
       xlab = "",
       ylab = "Energy sub metering")

  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")

  legend("topright", lwd = par("lwd"),
         col    = c(par("col"), "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty    = "n")

  # 4
  plot(datetime, Global_reactive_power,
     xlab = "datetime", ylab = "Global reactive power",
     type = "l")

})

dev.off()

