# plot4.R - Alex Gascoigne Sept. 8th, 2015

# read the data, using semicolon as separator, and "?" as NA value
rawdata<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# now get only 2007-02-01 and 2007-02-02 days
data1<-rawdata[rawdata$Date=="1/2/2007",]
data2<-rawdata[rawdata$Date=="2/2/2007",]
rm(rawdata)

# concatenate days together
pwrdata<-rbind(data1,data2,make.row.names=FALSE)

png(filename="plot4.png",width=480,height=480)

# Setup 4 subplots
par(mfrow = c(2,2))

# subplot1: Global Active Power, from plot2.R
gap<-pwrdata$Global_active_power
plot(gap,type="l",ylab="Global Active Power",axes=FALSE,xlab="")
axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
axis(2)
box()

# subplot2: Voltage
plot(pwrdata$Voltage,type="l",ylab="Voltage",axes=FALSE,xlab="datetime")
axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
axis(2)
box()

# subplot3: Sub metering, from plot3.R
sm1<-pwrdata$Sub_metering_1
sm2<-pwrdata$Sub_metering_2
sm3<-pwrdata$Sub_metering_3

plot(sm1,type="l",ylab="Energy sub metering",axes=FALSE,xlab="")
lines(sm2,col="red")
lines(sm3,col="blue")
axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
axis(2)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"),bty="n")
box()

# subplot4: Global reactive power
plot(pwrdata$Global_reactive_power,type="l",ylab="Global_reactive_power",axes=FALSE,xlab="datetime")
axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
axis(2)

dev.off()

