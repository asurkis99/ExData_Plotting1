# read in variabble names from household_power_consumption data file
hpcDatNames <- read.table("household_power_consumption.txt", sep=";",na.strings=c("?"),nrows=1,header=TRUE)

# read in observations starting 2/1/2007, and continuing for two days (2 days * 24 hours * 60 minutes)
hpcDat <- read.table("household_power_consumption.txt", header=FALSE, sep=";",na.strings=c("?"),skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=60*24*2)

# assign names to dataframe
names(hpcDat) = names(hpcDatNames)

# reformat the date field
hpcDat$Date <- as.Date(hpcDat$Date, "%d/%m/%Y")

# create a single date/time variable
hpcDat$DateTime <- paste(hpcDat$Date, hpcDat$Time)

# transform the date/time variable into a number for graphing purposes 
hpcDat$DateTimeNum <- strptime(hpcDat$DateTime, "%Y-%m-%d %H:%M:%S")

# create four panel graph and send to png file
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(hpcDat, plot(DateTimeNum, Global_active_power, type = "l", xlab = "", ylab="Global Active Power"))
with(hpcDat, plot(DateTimeNum, Voltage, type = "l", xlab = "datetime", ylab="Voltage"))
with(hpcDat, plot(DateTimeNum, Sub_metering_1, type = "l",col="black",ylab="Energy sub metering",xlab=""))
with(hpcDat, points(DateTimeNum, Sub_metering_2, type="l", col="red"))
with(hpcDat, points(DateTimeNum, Sub_metering_3, type="l", col="blue"))
legend("topright", names(hpcDat[7:9]),lty=1,col=c("black","red","blue"))
with(hpcDat, plot(DateTimeNum, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
