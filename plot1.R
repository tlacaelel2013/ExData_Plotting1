## set working directory
#setwd("C:/000-Data-Science-JHU-[Coursera]/c4-Exploratory-Data-Analysis/project1/")

## loading the data
fileName <- "exdata_data_household_power_consumption/household_power_consumption.txt"
df5 <- read.table(fileName, header=TRUE, sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

## read in date/time info in format 'd/m/y h:m:s'
x <- paste(df5$Date, df5$Time)
df5$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## subset for given dates
case1 <- as.POSIXct(df5$datetime) >= as.POSIXct("2007-02-01 PST")
case2 <- as.POSIXct(df5$datetime) < as.POSIXct("2007-02-03 PST")
index <- which(case1 & case2)
dataset <- df5[index, ]

## making plots

# Plot 1
par(mfrow=c(1,1))
hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## saving a PNG copy of the plot
dev.copy(device = png, filename = "plot1.png", width=480, height=480)
dev.off()

