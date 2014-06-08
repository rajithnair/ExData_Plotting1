library(data.table) ### Usage of this package enables faster reading of large data sets

### Reading the consumption dataset from the working directory

suppressWarnings(consumption_data<-fread("household_power_consumption.txt",na.strings ="?"))

### Subsetting data frame to fetch the consumption data from 01/02/2007 to 02/02/2007

data<-subset(consumption_data, consumption_data$Date %in% c("1/2/2007","2/2/2007"))

### Plotting Script

#Initializing png graphich device
png(file="plot1.png",width=480,height=480)

#Putting the numeric data into histogram function as it only acccepts numeric values
hist(as.numeric(data$Global_active_power),col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

