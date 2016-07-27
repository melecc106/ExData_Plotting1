#Read the data set in R
EPC<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

#change the class of the columns date and time
EPC$Date<-as.Date(EPC$Date, format="%d/%m/%Y")

#subset the data from the dates 2007-02-01 and 2007-02-02
EPC<- subset(EPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert and combine Date and Times
datetime<-paste(as.Date(EPC$Date), EPC$Time)
EPC$datetime<-as.POSIXct(datetime)

#create plot and copy into a png file
par(mfcol=c(2,2), mar=c(4, 4, 2, 1), oma=c(0,0,2,0))
plot(EPC$Global_active_power~EPC$datetime, xlab="", ylab="Global Active Power (kilowatts)", type="l")
plot(EPC$Sub_metering_1~EPC$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(EPC$Sub_metering_2~EPC$datetime, type="l", col="red")
lines(EPC$Sub_metering_3~EPC$datetime, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex=1)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex=0.75)
par(mfcol=c(2,2), mar=c(4, 4, 2, 1), oma=c(0,0,2,0))
plot(EPC$Global_active_power~EPC$datetime, xlab="", ylab="Global Active Power (kilowatts)", type="l")
plot(EPC$Sub_metering_1~EPC$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(EPC$Sub_metering_2~EPC$datetime, type="l", col="red")
lines(EPC$Sub_metering_3~EPC$datetime, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex=0.75)
plot(EPC$Voltage~EPC$datetime, type="l", xlab="datetime", ylab="Voltage")
plot(EPC$Global_reactive_power~EPC$datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()