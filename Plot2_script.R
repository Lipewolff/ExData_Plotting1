# Library

library(dplyr)
library(stringr)
library(lubridate)


# Getting data

data <- read.csv("household_power_consumption_filter.csv", sep = ";")
data_names <- names(data)
data$Datetime <- paste(data$Date, data$Time, sep = " ")

# Data cleaning and conversion
data$Datetime <- str_replace(data$Datetime, "-","/")

date <- data$Datetime
date = as.POSIXct(date, format="%d/%m/%Y %H:%M:%S")
date

data$Global_active_power <- as.numeric(str_replace(data$Global_active_power, ',', '.'))
data$Global_reactive_power <- as.numeric(str_replace(data$Global_reactive_power, ',', '.'))
data$Voltage <- as.numeric(str_replace(data$Voltage, ',', '.'))
data$Global_intensity <- as.numeric(str_replace(data$Global_intensity, ',', '.'))
data$Sub_metering_1 <- as.numeric(str_replace(data$Sub_metering_1, ',', '.'))
data$Sub_metering_2<- as.numeric(str_replace(data$Sub_metering_2, ',', '.'))
data$Sub_metering_3 <- as.numeric(str_replace(data$Sub_metering_3, ',', '.'))

data <- data[,-c(1,2,10)]
data <- cbind(date, data)                  

# plot 2

plot(x= data$date, y = data$Global_active_power/1000, type = "l", lwd = 1,
     ylab = "Global Active Power (kilowatts)", xlab = NA)