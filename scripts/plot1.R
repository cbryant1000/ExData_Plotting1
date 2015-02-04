
# Coursera Exploratory Data Analysis
#   Course Project 1, plot1.R

# Read the Electric power consumption data,
# and plot a histogram of the Global active power.

source("data.cache.R")

getData <- data.cache()
d <- getData()
png("plot1.png")
hist(d[,3],col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(quartz)
dev.off()
