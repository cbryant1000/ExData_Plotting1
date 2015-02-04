
# Coursera Exploratory Data Analysis
#   Course Project 1, plot2.R

# Read the Electric power consumption data,
# and plot the Global active power versus time.

source("data.cache.R")

if (is.null(getData)) {
  getData <- data.cache()  
}
d <- getData()
png("plot2.png")
with(d,plot(Time, Global_active_power,xlab="",ylab="Global active power (kilowatts)",type="l"))
dev.off()
