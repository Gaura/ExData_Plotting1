dat <- read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F)
dates <- dat$Date
dates <- strptime(dates,'%d/%m/%Y')
dt2007 <- which(dates$year == 107 & dates$mon == 1 & (dates$mday == 1 | dates$mday == 2)) #dates since 1900 monts 011
df <- dat[dt2007,]
df$dt <- paste(df$Date,df$Time)
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$dt <- strptime(df$dt,"%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png",height = 480, width = 480)
plot(df$dt,df$Global_active_power,type = 'l',xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()