library(data.table)

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

#Plot 2 
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")


#saving on device
dev.copy(png,"Plot2.png", height = 480, width = 480)
dev.off()