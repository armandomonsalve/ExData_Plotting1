
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

# Adding a new column "DateTime" by pasting columns Date and Time
HHPowerC$DateTime <- ymd_hms(paste(HHPowerC$Date, HHPowerC$Time))

# Checking for NA values
table(is.na(HHPowerC$Global_active_power))
head(HHPowerC)

# Checking structure and summary of DateTime and Global_active_power variables respectively
str(HHPowerC$DateTime)
summary(HHPowerC$Global_active_power)

# Plotting according to assignment
png("plot3.png", width=480, height=480)
with(HHPowerC, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", type = "l"))
with(HHPowerC, lines(DateTime, Sub_metering_2, col = "red"))
with(HHPowerC, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), lwd = c(1,1))
dev.off()