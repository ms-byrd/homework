data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date<- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')

x <- paste(subdata$Date, subdata$Time)
subdata$x <- strptime(x, "%Y-%m-%d %H:%M:%S")

windows()
par(bg="white")
par(mfrow=c(2,2))
	#first plot:
with(subdata, plot(x, Global_active_power, type="l",xlab="",ylab="Global Active Power"))
	#second plot:
with(subdata, plot(x, Voltage, type="l",xlab="datetime",ylab="Voltage"))
	#third plot:
plot (subdata$x,subdata$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering") 				# adds titles to the axes
lines(subdata$x,subdata$Sub_metering_1,col="black")
lines(subdata$x,subdata$Sub_metering_2,col="red")
lines(subdata$x,subdata$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),bty="n",cex=0.8) 
	#fourth plot:
with(subdata, plot(x, Global_reactive_power, type="l",xlab="datetime"))

dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
