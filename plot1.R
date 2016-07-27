#Code for creating plot 1: a histogram of the global active power

#Read the data set in R
EPC<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

#change the class of the columns date and time
EPC$Date<-as.Date(ECP$Date, format="%d/%m/%Y")

#subset the data from the dates 2007-02-01 and 2007-02-02
EPC<- subset(EPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create histogram into the png graphic device
png("plot1.png", width = 480, height=480)
hist(ECP$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()