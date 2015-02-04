

createDataCache <- function(d = data.frame()) {
  d <- NULL
  set <- function(y) {
    d <<- y
  }
  get <- function() d
  list(set = set, get = get)
}

getDataCache <- function(cache, ...) {
  ## Return a matrix that is the inverse of 'x'
  d <- cache$get()
  if(!is.null(d)) {
    message("getting cached data")
    return (d)
  }
  d <- readData()
  cache$set(d)
  d
}

readData <- function() {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,"curl")
  data <- read.table(unz(temp, "household_power_consumption.txt"),header=T,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))
  unlink(temp)
  data[,2] <- as.POSIXct(paste(data[,1],data[,2]),tz="GMT",format=c("%d/%m/%Y %H:%M:%S"))
  data[,1] <- as.Date(data[,1],"%d/%m/%Y")
  u1 <- (data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))
  data[u1,]
}