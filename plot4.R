library(data.table)
library(lubridate)
setwd("./Exploratory data analysis")
data=fread("household_power_consumption.txt"
           ,na.strings = "?")
dat = data[data$Date %in% c("1/2/2007","2/2/2007"),]
dat$Date = as.Date(dat$Date , "%d/%m/%Y") 
dt = cbind("date_time" = paste0(dat$Date," ",dat$Time), 
           "weekday" = weekdays(dt$Date),
           dat)
x=strptime(dt$date_time, "%Y-%m-%d %H:%M:%S")

png(file="results/plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(x,dt$Global_active_power,type="l",ylab="Global Active Power (kilowatts)"
     ,xlab="")

plot(x,dt$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x,dt$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(x,dt$Sub_metering_2,col="red")
lines(x,dt$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = c(1,1),lwd=c(1,1),col=c("black","red","blue"),cex=.7)

plot(x,dt$Global_reactive_power,type="l",xlab="datetime"
     ,ylab="Global_reactive_power")

dev.off()