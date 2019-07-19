dat <- read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F)
dates <- dat$Date
dates <- strptime(dates,'%d/%m/%Y')
dt2007 <- which(dates$year == 107 & dates$mon == 1 & (dates$mday == 1 | dates$mday == 2)) #dates since 1900 monts 011
df <- dat[dt2007,]
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$dt <- paste(df$Date,df$Time)
df$dt <- strptime(df$dt,"%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png",height = 480, width = 480)
par(mfrow=c(2,2))
plot(df$dt,df$Global_active_power,ylab = "Global Active Power",xlab = "",type = 'l')
plot(df$dt,df$Voltage,ylab = "Voltage",xlab = "datetime",type = 'l')
plot(df$dt,df$Sub_metering_1,type = 'l',ylab = "Energy sub metering",xlab = "")
lines(df$dt,df$Sub_metering_2,col = 'red')
lines(df$dt,df$Sub_metering_3,col = 'blue')
legend("topright",pch = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
plot(df$dt,df$Global_reactive_power,type = 'l',xlab = 'datetime',ylab = "Global_reactive_power")
dev.off()