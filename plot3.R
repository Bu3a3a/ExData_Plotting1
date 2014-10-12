setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, 
                                                   format="%d/%m/%Y"))
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",
                   na.strings="?", colClasses=c("myDate","character",
                                                "numeric","numeric","numeric",
                                                "numeric","numeric","numeric",
                                                "numeric"))
myHalfOfData <- data[data$Date>="2007-02-01",]
myData <- myHalfOfData[myHalfOfData$Date<="2007-02-02",]
myDateChr <- as.character(myData$Date)
myTimeChr <- myData$Time
myTimeFull <- paste(myDateChr, myTimeChr)
myData$Time <- strptime(myTimeFull, format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot3.png", width = 480, height = 480)
plot(myData$Time, myData$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab=' ', main=' ')
points(myData$Time,myData$Sub_metering_1, type="l", col="black")
points(myData$Time,myData$Sub_metering_2, type="l", col="red")
points(myData$Time,myData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                            lwd=1, col=c("black","red","blue"))
dev.off()