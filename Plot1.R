## Coursera Exploratory Data Analysis
## 2014-10-12
## Plot1.R

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

# Reformat Date (dd/mm/yyy)
AllData$Date <- as.Date(AllData$Date, format = "%d/%m/%Y")
class(AllData$Date)
# [1] "Date"

#  Only analyze Feb 2007 dataset
FebData <- AllData[AllData$Date == "2007-02-01" | AllData$Date == "2007-02-02", ]
dim(FebData)
# [1] 2880    9

# Generate Graph
png(filename = "plot1.png", width = 480, height = 480)
with(FebData, hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"))
dev.off()