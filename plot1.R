
# read the relevant subset of consumption data
source("readdata.R")
consumption = readdata()

# defaults suit us: width = 480, height = 480, units = "px"
png("plot1.png")

hist(consumption$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()




