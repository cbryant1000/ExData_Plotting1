
# Coursera Exploratory Data Analysis
#   Course Project 1, plot4.R

# Read the Electric power consumption data, and plot,
# 1. the Global active power versus time,
# 2. the 3 Energy sub metering series versus time,
# 3. the Voltage versus time, and
# 4. the Global reactive power versus time.

source("data.cache.R")

if (is.null(getData)) {
  getData <- data.cache()  
}
d <- getData()
png("plot4.png")
par(mfcol=c(2,2))
with(d,{plot (Time, Global_active_power,xlab="",ylab="Global active power",type="l")
        plot (Time, Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
        lines(Time, Sub_metering_1)
        lines(Time, Sub_metering_2,col="red")
        lines(Time, Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")
        plot (Time, Voltage,xlab="datetime",type="l")
        plot (Time, Global_reactive_power,xlab="datetime",type="l")})
dev.off()
