data <- read.table("household_power_consumption.txt",sep=";"
                   ,header=TRUE,na.strings ="?",stringsAsFactors=FALSE)
data$DateTime <- paste(data$Date, data$Time)
##data$DateTime <- paste("16/12/2006", "17:24:00")
data$DateTime <- as.Date(data$DateTime,'%d/%m/%Y %H:%M:%S')
finaldata <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"),DateTime < as.Date("2007-02-03 00:00:00"))
hist(finaldata$Global_active_power, col = "red" , xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
