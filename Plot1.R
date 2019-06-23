library(data.table)

powerDT = data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?" )

head(powerDT$Date)

#convert the date variable to date format
powerDT$Date = as.Date(powerDT$Date, format = "%d/%m/%Y" )


#subsetting date
data = subset(powerDT, subset = (Date>="2007-02-01" & Date <= "2007-02-02"))

#removing na values
data = data[complete.cases(data)]


#Merge Date and time
datetime = paste(data$Date, data$Time)

datetime = setNames(datetime, "DateTime")

data = cbind(datetime,data)

#format datetime column
data$datetime = as.POSIXct(datetime)



#Plot 1
attach(data)
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowaatts)", col = "Red")

#save file and close
dev.copy(png, "Plot1.png", width = 480, height = 480)
dev.off()

detach(data)




























































































