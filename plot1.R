setwd("/Users/emkarson/Documents/coursera/exploratory_data")

xx<-read.table("household_power_consumption.txt",sep=";",na.strings = "?")
colnames(xx)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
yy<-xx[xx$Date %in% c("1/2/2007","2/2/2007"),]

yy$Time<-strptime(yy$Time,"%H:%M:%S")
yy$Time<-format(yy$Time, format="%H:%M:%S")

yy$Date<-strptime(yy$Date,"%m/%d/%Y")

yy$Global_active_power<-as.numeric(as.character(yy$Global_active_power))

png(filename="plot1.png")
hist(yy$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (Kilowatts)",
     ylab="Frequency",breaks=12,ylim=c(0,1200),yaxt="n")
axis(side=2,at=c(0,200,400,600,800,1000,1200),labels=c("0","200","400","600","800","1000","1200"))
dev.off()