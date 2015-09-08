# plot3.R - Alex Gascoigne Sept. 8th, 2015

# read the data, using semicolon as separator, and "?" as NA value
rawdata<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# now get only 2007-02-01 and 2007-02-02 days
data1<-rawdata[rawdata$Date=="1/2/2007",]
data2<-rawdata[rawdata$Date=="2/2/2007",]
rm(rawdata)

# concatenate days together
pwrdata<-rbind(data1,data2,make.row.names=FALSE)

# construct a plot of sub_metering_1, sub_metering_2, sub_metering_3

sm1<-pwrdata$Sub_metering_1
sm2<-pwrdata$Sub_metering_2
sm3<-pwrdata$Sub_metering_3

png(filename="plot3.png",width=480,height=480)
plot(sm1,type="l",ylab="Energy sub metering",axes=FALSE,xlab="")
lines(sm2,col="red")
lines(sm3,col="blue")
axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
axis(2)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"))
box()
dev.off()
