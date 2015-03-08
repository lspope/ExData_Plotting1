## plot1.R

## Download and unzip the data
prepData <- function() {
    ## Create a data directory in the current working directory
    if(!file.exists("data)")) { 
        dir.create("data")
    }
    
    ## Download zip file from the web
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile="./data/household_power_consumption.zip", method="curl")
    dateDownloaded <- date()
    ## Unzip the zip file into the data directory 
    unzip("./data/household_power_consumption.zip", exdir="./data/")
}

prepData()
power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", as.is =c("Date","Time"), na.strings = "?")
## we only want observations for 2 days: Feb 1 and Feb 2. Date format is D/M/YYY.
powersubset <- subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")
hist(powersubset$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power")
dev.copy(png, file="plot1.png", width=480,height=480)
dev.off()
