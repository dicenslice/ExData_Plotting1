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

png(file="results/plot1.png",width=480,height=480)
hist(as.numeric(dat$Global_active_power),col="red"
     ,xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()