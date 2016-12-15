hpcDatNames <- read.table("household_power_consumption.txt", sep=";",na.strings=c("?"),nrows=1,header=TRUE)
hpcDat <- read.table("household_power_consumption.txt", header=FALSE, sep=";",na.strings=c("?"),skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=60*24*2-1)
names(hpcDat) = names(hpcDatNames)

hpcDat$Date <- as.Date(hpcDat$Date, "%d/%m/%Y")
hpcDat$DateTime <- paste(hpcDat$Date, hpcDat$Time)
hpcDat$DateTimeNum <- strptime(hpcDat$DateTime, "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px")
with(hpcDat, plot(DateTimeNum, Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)"))
dev.off()
