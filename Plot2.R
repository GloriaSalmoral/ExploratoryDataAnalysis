# set working directory 
setwd("~/Coursera/4ExploratoryDataAnalysis/Project1")

# make sure the plots folder exists
if (!file.exists("PNGfiles")) {
        dir.create("PNGfiles")
}

# load data
dt <- read.table("dataTrans/power_consumption.txt", sep = "|", header = TRUE, ,na.strings='?')

# open device
png(filename='PNGfiles/plot2.png',width=480,height=480,units='px')

# plot DateTime against GlobalActivePower
plot(dt$DateTime, dt$GlobalActivePower, ylab='Global Active Power (kilowatts)', xlab='', type='l', xaxt = 'n')
axis(1,at=c(1,1440, 2880),  labels = c("Thu", "Fri", "Sat")) 

# close device
dev.off()
