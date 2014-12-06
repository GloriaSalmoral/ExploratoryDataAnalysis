# set working directory 
setwd("~/Coursera/4ExploratoryDataAnalysis/Project1")

# make sure the folder for the PNG files exists
if (!file.exists("PNGfiles")) {
        dir.create("PNGfiles")
}

# load data
dt <- read.table("dataTrans/power_consumption.txt", sep = "|", header = TRUE, ,na.strings='?')

# open device
png(filename='PNGfiles/plot1.png',width=480,height=480,units='px')

# plot the frequency of GlobalActivePower
hist(dt$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
dev.off()