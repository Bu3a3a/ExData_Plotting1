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
GlobalActivePower <- myData$Global_active_power
Sys.setlocale("LC_TIME", "English")
png("plot2.png",width = 480, height = 480)
plot(myData$Time,GlobalActivePower, ylab="Global Active Power (kilowatts)",
     type="l", xlab=' ', main=' ')
dev.off()