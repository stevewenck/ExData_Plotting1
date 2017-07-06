## Data Science Course 4 - Course Project 1
## Exploratory Data Analysis with R
## Steve Wenck
## July 6, 2017

## This program produces 4th of 4 plots of energy usage over a 2 day period in February 2007.

## Change working directory
setwd("~/R/Coursera/Data Science/Course 4/Assignment 1")

## Read UCI Irvine Machine learning Repository Electric Power Consumption data
hhpwrcnsmpt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Filter data to only the dates of interest (Feb 1-2, 2007)
hhpwrcnsmpt <- subset(hhpwrcnsmpt, Date %in% c("1/2/2007","2/2/2007"))

## Convert Date strings to date
hhpwrcnsmpt$Date <- as.Date(hhpwrcnsmpt$Date, format="%d/%m/%Y")

## Combine Date and Time into a single date/time variable
hhpwrcnsmpt$DateTime <- as.POSIXct(paste(as.Date(hhpwrcnsmpt$Date), hhpwrcnsmpt$Time))

## Set plotting parameters - modify rows/columns, margins, and outer margin area
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Create 4 line plots of consumption by day & time on screen
with(hhpwrcnsmpt, {
    plot(Global_active_power~DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(Voltage~DateTime, type="l", xlab="datetime", ylab="Voltage")
    plot(Sub_metering_1~DateTime, type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~DateTime, col='Red')
    lines(Sub_metering_3~DateTime, col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")
})

## Output line plot to a PNG file (copy didn't work with legend)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hhpwrcnsmpt, {
    plot(Global_active_power~DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(Voltage~DateTime, type="l", xlab="datetime", ylab="Voltage")
    plot(Sub_metering_1~DateTime, type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~DateTime, col='Red')
    lines(Sub_metering_3~DateTime, col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()
