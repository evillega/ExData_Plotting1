## Coursera Exploratory Data Analysis
## 2014-10-12
## Plot2.R

#==========================================================================================
# i. Prepare directory and load any required packages
#==========================================================================================
# check working directory
getwd()

# if wrong working directory then set directory
# insert file path between the ""
setwd("~/Desktop/Coursera/Data Science/4-Exploratory Data Analysis/4-Project_1/ExData_Plotting1")
# Clean up workspace
rm(list = ls())

# Check if "data" directory already exists.
# If not, then it creates "data" directory, where all data pertaining to this code
# are stored.  
if(!file.exists("data")) {
     dir.create("data")
}

# Downloads data as data.table, converts date and time columns classes as "character
# and the rest of the columns as numeric.
AllData <- read.table("./data/household_power_consumption.txt",
                      header = TRUE,
                      sep = ";",
                      colClasses = c(rep("character", 2), rep("numeric",7)),
                      na = "?")
dim(AllData)
# [1] 2075259       9

#check class of each column
class(AllData[, 1])
#[1] "character" . Performed the same command for the remaining columns

# Reformat Date (dd/mm/yyy)
AllData$Date <- as.Date(AllData$Date, format = "%d/%m/%Y")

#  Only analyze Feb 2007 dataset
FebData <- AllData[AllData$Date == "2007-02-01" | AllData$Date == "2007-02-02", ]
dim(FebData)
#[1] 2880    9

# Create a new column with corrected Date and Time formats combined
FebData$DateTime <- paste(FebData$Date, FebData$Time, sep = " ")
FebData$DateTime <- strptime(FebData$DateTime, format = "%Y-%m-%d %H:%M:%S")
# check class of Date column
class(FebData$DateTime)
# [1] "POSIXlt" "POSIXt" 

# Generate Graph
png(filename = "plot2.png", width = 480, height = 480)
with(FebData, plot(DateTime, 
                  Global_active_power,
                  type = "l",
                  xlab =" ",
                  ylab = "Global Active Power (kilowatts)"))
dev.off()