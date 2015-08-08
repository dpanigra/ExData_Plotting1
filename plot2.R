## Read the data file.
all_data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Format the "Date" attribute
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Collect only data for the duration between "2007-02-01" and "2007-02-02"
subset_data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##remove all_data to free up memory
rm(all_data)

## Create a new attribute with both data and time combined (e.g. combine 2/1/2007 and 00:01:00) 
date_time_attr <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Date_time <- as.POSIXct(date_time_attr)

## plot and save the graph to a png file
plot(subset_data$Global_active_power~subset_data$Date_time, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

##remove subset_data to free up memory
rm(subset_data)
##remove date_time_attr to free up memory
rm(date_time_attr)