data <- read.table("household_power_consumption.txt",sep=";"
                   ,header=TRUE,na.strings ="?",stringsAsFactors=FALSE)
data$DateTime <- paste(data$Date, data$Time)
##data$DateTime <- paste("16/12/2006", "17:24:00")
data$DateTime <- as.Date(data$DateTime,'%d/%m/%Y %H:%M:%S')
finaldata <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"),DateTime < as.Date("2007-02-03 00:00:00"))
##finaldata[,Time_formatted:=as.POSIXct(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))]
##finaldata$DateTime <- strptime(paste(as.character(finaldata$Date), finaldata$Time), format = "%Y-%m-%d %H:%M:%S")
finaldata$DateTime1 <- as.POSIXct(paste(as.Date(finaldata$Date,format = "%d/%m/%Y" ), finaldata$Time))
par(mfrow=c(2,2),mar = c(4,4,2,1), oma= c(0,0,2,0))
with(finaldata,{plot(finaldata$Global_active_power~finaldata$DateTime1, 
                     type =  "l",xlab = "",ylab = "Global Active Power(kilowatts)")
                plot(finaldata$Voltage~finaldata$DateTime1, 
                     type =  "l",xlab = "datetime",ylab = "Voltage")
                plot(finaldata$Sub_metering_1~finaldata$DateTime1, 
                     type =  "l",xlab = "",ylab = "Energy Sub Metering")
                lines(Sub_metering_2~finaldata$DateTime1,col='Red')
                lines(Sub_metering_3~finaldata$DateTime1,col='Blue')
                legend("topright", col=c("black","red","blue"),lty =1, lwd = 1 ,bty="n",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                plot(finaldata$Global_reactive_power~finaldata$DateTime1, 
                     type =  "l",xlab = "datetime",ylab = "Global_Reactive_Power")
})

dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
