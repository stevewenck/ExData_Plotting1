## Data Science Course 4 - Course Project 1
## Exploratory Data Analysis with R
## Steve Wenck
## July 6, 2017

## This program produces 2nd of 4 plots of energy usage over a 2 day period in February 2007.

## Change working directory
setwd("~/R/Coursera/Data Science/Course 4/Assignment 1")

## Read UCI Irvine Machine learning Repository Electric Power Consumption data
hhpwrcnsmpt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Filter data to only the dates of interest (Feb 1-2, 2007)
hhpwrcnsmpt <- subset(hhpwrcnsmpt, Date %in% c("1/2/2007","2/2/2007"))

## Convert Date strings to date
hhpwrcnsmpt$Date <- as.Date(hhpwrcnsmpt$Date, format="%d/%m/%Y")

## Combine Date and Time into a date/time variable
hhpwrcnsmpt$DateTime <- as.POSIXct(paste(as.Date(hhpwrcnsmpt$Date), hhpwrcnsmpt$Time))

## Create line plot of Global Active Power by day & time on screen
with(hhpwrcnsmpt, {
    plot(Global_active_power~DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})

## Output line plot to a PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
