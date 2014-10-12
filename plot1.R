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
GlobalActivePower <- myData$Global_active_power
png("plot1.png",width = 480, height = 480)
hist(GlobalActivePower,col='red',xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()