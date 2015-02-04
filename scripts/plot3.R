
# Coursera Exploratory Data Analysis
#   Course Project 1, plot3.R

# Read the Electric power consumption data,
# and plot the 3 Energy sub metering series versus time.
# Add a legend to the plot identifying each series.

source("data.cache.R")

if (is.null(getData)) {
  getData <- data.cache()  
}
d <- getData()
png("plot3.png")
with(d,{plot (Time, Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
        lines(Time, Sub_metering_1)
        lines(Time, Sub_metering_2,col="red")
        lines(Time, Sub_metering_3,col="blue")})
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()
