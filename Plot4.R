# set working directory 
setwd("~/Coursera/4ExploratoryDataAnalysis/Project1")

# make sure the plots folder exists
if (!file.exists("PNGfiles")) {
        dir.create("PNGfiles")
}

# load data
dt <- read.table("dataTrans/power_consumption.txt", sep = "|", header = TRUE, ,na.strings='?')

# open device
png(filename='PNGfiles/plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot data on 1,1
plot(dt$DateTime,dt$GlobalActivePower,ylab='Global Active Power',xlab='',type='l', xaxt = 'n')
axis(1,at=c(1,1440, 2880),  labels = c("Thu", "Fri", "Sat")) 

# plot data on 1,2
plot(dt$DateTime,dt$Voltage,xlab='datetime',ylab='Voltage',type='l', xaxt = 'n')
axis(1,at=c(1,1440, 2880),  labels = c("Thu", "Fri", "Sat")) 

# plot data on 2,1
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(dt$DateTime,dt$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering',  xaxt = 'n')
axis(1,at=c(1,1440, 2880),  labels = c("Thu", "Fri", "Sat")) 
lines(dt$DateTime,dt$SubMetering2,col=lncol[2])
lines(dt$DateTime,dt$SubMetering3,col=lncol[3])

# plot data on 2,2
plot(dt$DateTime,dt$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l', xaxt = 'n')
axis(1,at=c(1,1440, 2880),  labels = c("Thu", "Fri", "Sat")) 

# close device
dev.off()