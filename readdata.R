#
# ugly code that reads consumption data for two dates:
#   2007-02-01 and 2007-02-02 (Feb.1 and Feb.2 of 2007)
#
#The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#
#    Date: Date in format dd/mm/yyyy
#    Time: time in format hh:mm:ss
#    Global_active_power: household global minute-averaged active power (in kilowatt)
#    Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#    Voltage: minute-averaged voltage (in volt)
#    Global_intensity: household global minute-averaged current intensity (in ampere)
#    Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#    Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#    Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#
# EXAMPLE:
# =======
#Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
#16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
#16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000

readdata = function() {
  file = "../data/household_power_consumption.txt"

  consumption_all <- read.table(file, header=TRUE, sep=";", quote="", dec=".",
                                colClasses = c("character", # Date
                                  "character", # Time
                                  "numeric",   # Global_active_power
                                  "numeric",   # Global_reactive_power
                                  "numeric",   # Voltage
                                  "numeric",   # Global_intensity
                                  "numeric",   # Sub_metering_1
                                  "numeric",   # Sub_metering_2
                                  "numeric"    # Sub_metering_3
                                  ),
                                blank.lines.skip = TRUE,
                                na.strings = "?"  # In this dataset missing values are coded as ?
                                )

#  head(consumption_all)

# we need data on two dates 2007-02-01 and 2007-02-02 - Feb.1 and Feb.2 of 2007
  consumption = subset(consumption_all, Date == "1/2/2007" | Date == "2/2/2007")

  return(consumption)
}

