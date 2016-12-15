hpcDatNames <- read.table("household_power_consumption.txt", sep=";",na.strings=c("?"),nrows=1,header=TRUE)
hpcDat <- read.table("household_power_consumption.txt", header=FALSE, sep=";",na.strings=c("?"),skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=60*24*2-1)
names(hpcDat) = names(hpcDatNames)
png("plot1.png", width = 480, height = 480, units = "px")
hist(hpcDat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts")
dev.off()



