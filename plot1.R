
# Libraries
options(scipen=999)
library(lubridate)
library(dplyr)

# Importing data
setwd("Y:/DATA SCIENCE/Johns Hopkins University Data Science Course/4 Exploratory Data Analysis/Week 1/Project/ExData_Plotting1")
HHPowerC <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Checking variables data types
str(HHPowerC)

# Transforming Date in date type
HHPowerC$Date <- as.character(HHPowerC$Date)
HHPowerC$Date <- dmy(HHPowerC$Date)

# Filtering according to assignment
HHPowerC <- filter(HHPowerC, Date >= "2007-02-01" & Date <="2007-02-02")
dim(HHPowerC)

# Checking for NA values
table(is.na(HHPowerC$Global_active_power))
head(HHPowerC)

# Checking summary of Global_active_power variable
summary(HHPowerC$Global_active_power)

# Plotting according to assignment
png("plot1.png", width=480, height=480)
with(HHPowerC, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()