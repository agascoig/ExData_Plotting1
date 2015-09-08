# plot1.R - Alex Gascoigne Sept. 8th, 2015

# read the data, using semicolon as separator, and "?" as NA value
rawdata<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# now get only 2007-02-01 and 2007-02-02 days
data1<-rawdata[rawdata$Date=="1/2/2007",]
data2<-rawdata[rawdata$Date=="2/2/2007",]
rm(rawdata)

# concatenate days together
pwrdata<-rbind(data1,data2)

# construct a histogram of global active power
gap<-pwrdata$Global_active_power

png(filename="plot1.png",width=480,height=480)
hist(gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",
     col="Red")
dev.off()

