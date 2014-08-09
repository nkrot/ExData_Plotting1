
# read the relevant subset of consumption data
source("readdata.R")
consumption = readdata()

Sys.setlocale("LC_TIME", "C")

days = strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png")

with(consumption, {
  # TODO: just guessing that Sub_metering_1 provides the correct Y label size
  plot(days, Sub_metering_1, type = "n",
     xlab = "",
     ylab = "Energy sub metering")

  lines(days, Sub_metering_1)
  lines(days, Sub_metering_2, col = "red")
  lines(days, Sub_metering_3, col = "blue")

  legend("topright", lwd = par("lwd"),
         col    = c(par("col"), "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()
