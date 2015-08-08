## Read the data file.
all_data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Format the "Date" attribute
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Collect only data for the duration between "2007-02-01" and "2007-02-02"
subset_data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##remove all_data to free up memory
rm(all_data)

## Plot the histogram
hist(subset_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save the graph to a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

##remove subset_data to free up memory
rm(subset_data)