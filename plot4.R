setwd("/Users/emkarson/Documents/coursera/exploratory_data")

xx<-read.table("household_power_consumption.txt",sep=";",na.strings = "?")
colnames(xx)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
yy<-xx[xx$Date %in% c("1/2/2007","2/2/2007"),]

yy$Time<-strptime(yy$Time,"%H:%M:%S")
yy$Time<-format(yy$Time, format="%H:%M:%S")

yy$Date<-strptime(yy$Date,"%m/%d/%Y")

yy$Global_active_power<-as.numeric(as.character(yy$Global_active_power))
yy$Global_reactive_power<-as.numeric(as.character(yy$Global_reactive_power))
yy$Sub_metering_1<-as.numeric(as.character(yy$Sub_metering_1))
yy$Sub_metering_2<-as.numeric(as.character(yy$Sub_metering_2))
yy$Sub_metering_3<-as.numeric(as.character(yy$Sub_metering_3))
yy$Voltage<-as.numeric((as.character(yy$Voltage)))

png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(yy$Global_active_power,main="",type="l",ylab="Global Active Power",xlab="",yaxt="n",xaxt="n",ylim=c(0,7))
axis(side=1,at=c(0,1500,2800),labels=c("Thur","Fri","Sat"))
axis(side=2,at=c(0,2,4,6),labels=c("0","2","4","6"))

plot(yy$Voltage,col="black",type="l",ylab="Voltage",xaxt="n",xlab="datetime")
axis(side=1,at=c(0,1500,2800),labels=c("Thur","Fri","Sat"))

xrange=length(yy$Date)
yrange=range(yy$Sub_metering_1)
plot(yy$Sub_metering_1,col="grey", type="l",ylab="Energy sub metering",main="",xlab="",yaxt="n",xaxt="n",
     ylim=c(0,40))
lines(yy$Sub_metering_2,col="red")
lines(yy$Sub_metering_3,col="blue")
legend("topright",c("Submetering_1","Submetering_2","Submetering_3"),pch="-",col=c("grey","red","blue"))
axis(side=1,at=c(0,1500,2800),labels=c("Thur","Fri","Sat"))
axis(side=2,at=c(0,10,20,30),labels=c("0","10","20","30"))

plot(yy$Global_reactive_power,col="black",type="l",ylab="Global_active_power",xaxt="n",xlab="datetime")
axis(side=1,at=c(0,1500,2800),labels=c("Thur","Fri","Sat"))
dev.off() 

