# set working directory 
setwd("~/Coursera/4ExploratoryDataAnalysis/Project1")

# make sure the plots folder exists
if (!file.exists("PNGfiles")) {
        dir.create("PNGfiles")
}

# load data
dt <- read.table("dataTrans/power_consumption.txt", sep = "|", header = TRUE, ,na.strings='?')

# open device
png(filename='PNGfiles/plot3.png',width=480,height=480,units='px')

# plot data
color<-c('black','red','blue')
legend<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(dt$DateTime,dt$SubMetering1,type='l',col=color[1],xlab='',ylab='Energy sub metering', xaxt = 'n')
lines(dt$DateTime,dt$SubMetering2,col=color[2])
lines(dt$DateTime,dt$SubMetering3,col=color[3])
axis(1,at=c(1,1440, 2880),  labels = c("Thu", "Fri", "Sat")) 

# add legend
legend('topright',legend=legend,col=color,lty='solid')

# close device
dev.off()