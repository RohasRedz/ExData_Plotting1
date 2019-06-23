library(data.table)


rm ( list = ls())
powerDT = read.table("household_power_consumption.txt", header = T, 
                     sep = ";", na.strings = "?")


head(powerDT$Date)

#convert the date variable to date format
powerDT$Date = as.Date(powerDT$Date, format = "%d/%m/%Y" )


#subsetting date
data = subset(powerDT, subset = (Date>="2007-02-01" & Date <= "2007-02-02"))




#Merge Date and time
datetime = paste(data$Date, data$Time)

datetime = setNames(datetime, "DateTime")

data = cbind(datetime,data)

#format datetime column
data$datetime = as.POSIXct(datetime)

#Plot 3 
with(data = data, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub meeting", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saving on device
dev.copy(png,"Plot3.png", height = 480, width = 480)
dev.off()