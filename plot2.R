

library(data.table) ### Usage of this package enables faster reading of large data sets

### Reading the consumption dataset from the working directory

suppressWarnings(consumption_data<-fread("household_power_consumption.txt",na.strings ="?"))

### Subsetting data frame to fetch the consumption data from 01/02/2007 to 02/02/2007

data<-subset(consumption_data, consumption_data$Date %in% c("1/2/2007","2/2/2007"))

### Adding a new column DateTime merging both date and time columns
data$DateTime<-paste(data$Date,data$Time)

### Transforming DateTime from character to POSIXct format for representing date and time 
data$DateTime<-as.POSIXct(data$DateTime,format="%d/%m/%Y %H:%M:%S")

### Plotting Script

#Initializing png graphich device
png(file="plot2.png",width=480,height=480)

plot(data$Global_active_power ~ data$DateTime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()