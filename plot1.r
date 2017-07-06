## Data Science Course 4 - Course Project 1
## Exploratory Data Analysis with R
## Steve Wenck
## July 6, 2017

## This program produces 1st of 4 plots of energy usage over a 2 day period in February 2007.

## Change working directory
setwd("~/R/Coursera/Data Science/Course 4/Assignment 1")

## Read UCI Irvine Machine learning Repository Electric Power Consumption data
hhpwrcnsmpt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Filter data to only the dates of interest (Feb 1-2, 2007)
hhpwrcnsmpt <- subset(hhpwrcnsmpt, Date %in% c("1/2/2007","2/2/2007"))

## Create histogram of Global Active Power on screen
hist(hhpwrcnsmpt$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Output histogram to a PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()