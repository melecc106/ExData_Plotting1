#Read the data set in R
EPC<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

#change the class of the columns date and time
EPC$Date<-as.Date(EPC$Date, format="%d/%m/%Y")

#subset the data from the dates 2007-02-01 and 2007-02-02
EPC<- subset(EPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert and combine Date and Times
datetime<-paste(as.Date(EPC$Date), EPC$Time)
EPC$datetime<-as.POSIXct(datetime)

#Create a line plot and copy into a png file
plot(EPC$Global_active_power~EPC$datetime, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(device=png, file="plot2.png", width=480, height=480)
dev.off()