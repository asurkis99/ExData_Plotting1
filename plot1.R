# read in variabble names from household_power_consumption data file
hpcDatNames <- read.table("household_power_consumption.txt", sep=";",na.strings=c("?"),nrows=1,header=TRUE)

# read in observations starting 2/1/2007, and continuing for two days (2 days * 24 hours * 60 minutes)
hpcDat <- read.table("household_power_consumption.txt", header=FALSE, sep=";",na.strings=c("?"),skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=60*24*2)

# assign names to dataframe
names(hpcDat) = names(hpcDatNames)

# create graph and send to png file
png("plot1.png", width = 480, height = 480, units = "px")
hist(hpcDat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts")
dev.off()



