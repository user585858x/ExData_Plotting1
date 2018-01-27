setwd("/Users/emkarson/Documents/coursera/exploratory_data")

xx<-read.table("household_power_consumption.txt",sep=";",na.strings = "?")
colnames(xx)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
yy<-xx[xx$Date %in% c("1/2/2007","2/2/2007"),]

yy$Time<-strptime(yy$Time,"%H:%M:%S")
yy$Time<-format(yy$Time, format="%H:%M:%S")

yy$Date<-strptime(yy$Date,"%m/%d/%Y")

yy$Global_active_power<-as.numeric(as.character(yy$Global_active_power))

png(filename="plot2.png")
plot(yy$Global_active_power,main="",type="l",ylab="Global Active Power (kilowatts)",xlab="",yaxt="n",xaxt="n",
     ylim=c(0,7))
axis(side=1,at=c(0,1500,2800),labels=c("Thur","Fri","Sat"))
axis(side=2,at=c(0,2,4,6),labels=c("0","2","4","6"))
dev.off()
