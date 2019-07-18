dat <- read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F)
dates <- dat$Date
dates <- strptime(dates,'%d/%m/%Y')
dt2007 <- which(dates$year == 107 & dates$mon == 1 & (dates$mday == 1 | dates$mday == 2)) #dates since 1900 monts 011
df <- dat[dt2007,]
png(filename = "plot1.png",height = 480, width = 480)
hist(as.numeric(df$Global_active_power), col = 'red', main = "Global Acitve Power", xlab = "Global Active Power (kilowatts)")
dev.off()
