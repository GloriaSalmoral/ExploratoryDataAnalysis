# set working directory 
setwd("~/Coursera/4ExploratoryDataAnalysis/Project1")

# required packages
library(data.table)
library(lubridate)

# check if data Initial and data trandformed folder exist
if (!file.exists("dataInit")) {
        dir.create("dataInit")
}

if (!file.exists("dataTrans")) {
        dir.create("dataTrans")
}
# check existing tidy data set exists
if (!file.exists("dataTrans/powerConsumption.txt")) {
        
        # download the zip file and unzip
        file.url<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(file.url,destfile="dataInit/powerConsumption.zip")
        unzip("dataInit/powerConsumption.zip",exdir="dataInit",overwrite=TRUE)
        
        # read the raw table and select only 2 days
        variable.class<-c(rep("character",2),rep("numeric",7))
        dt <-read.table("dataInit/household_power_consumption.txt",header=TRUE,
                                      sep=";", na.strings="?", colClasses=variable.class)
        dt <-dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
        
        # clean up the variable names and convert date/time fields
        names<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
                'SubMetering1','SubMetering2','SubMetering3')
        colnames(dt)<-names
        dt$DateTime<-dmy(dt$Date)+hms(dt$Time)
        dt<-dt[,c(10,3:9)]
        
        # write a clean data set to the directory
        write.table(dt,file='dataTrans/power_consumption.txt',sep='|',row.names=FALSE)
} else {
        
        dt<-read.table('dataTrans/power_consumption.txt',header=TRUE,sep='|')
        dt$DateTime<-as.POSIXlt(dt$DateTime)
        
}


