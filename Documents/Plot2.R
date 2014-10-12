data <- read.table("household_power_consumption.txt",sep=";"
                   ,header=TRUE,na.strings ="?",stringsAsFactors=FALSE)
data$DateTime <- paste(data$Date, data$Time)
##data$DateTime <- paste("16/12/2006", "17:24:00")
data$DateTime <- as.Date(data$DateTime,'%d/%m/%Y %H:%M:%S')
finaldata <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"),DateTime < as.Date("2007-02-03 00:00:00"))
##finaldata[,Time_formatted:=as.POSIXct(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))]
##finaldata$DateTime <- strptime(paste(as.character(finaldata$Date), finaldata$Time), format = "%Y-%m-%d %H:%M:%S")
finaldata$DateTime1 <- as.POSIXct(paste(as.Date(finaldata$Date,format = "%d/%m/%Y" ), finaldata$Time))
plot(finaldata$Global_active_power~finaldata$DateTime1, type =  "l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
