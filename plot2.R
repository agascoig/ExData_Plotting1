# plot2.R - Alex Gascoigne Sept. 8th, 2015

# read the data, using semicolon as separator, and "?" as NA value
rawdata<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# now get only 2007-02-01 and 2007-02-02 days
data1<-rawdata[rawdata$Date=="1/2/2007",]
data2<-rawdata[rawdata$Date=="2/2/2007",]
rm(rawdata)

# concatenate days together
pwrdata<-rbind(data1,data2,make.row.names=FALSE)

# construct a plot of global active power
png(filename="plot2.png",width=480,height=480)
gap<-pwrdata$Global_active_power

plot(gap,type="l",ylab="Global Active Power (kilowatts)",axes=FALSE,xlab="")
axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off()
