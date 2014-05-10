## Read data
data<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")

## Trim data to complete cases
data<-data[complete.cases(data),]

## Convert date and trim data to date range of interest
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,Date>=as.Date("2007-02-01",format="%Y-%m-%d") & Date<=as.Date("2007-02-02",format="%Y-%m-%d"))

##Convert time to POSIXlt
data$Time<-paste(data$Date,data$Time,sep=" ")
data$Time<-strptime(data$Time,format="%Y-%m-%d %T")


##Generate plot
png("plot3.png",width=480,height=480)
plot(data$Time,data$Sub_metering_1,type="n", ylab="Energy sub metering",xlab="")
lines(data$Time,data$Sub_metering_1,type="l", col="Black")
lines(data$Time,data$Sub_metering_2,type="l", col="Red")
lines(data$Time,data$Sub_metering_3,type="l", col="Blue")
legend("topright", lty=c("solid","solid","solid"), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()