data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date<- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')

x <- paste(subdata$Date, subdata$Time)
subdata$x <- strptime(x, "%Y-%m-%d %H:%M:%S")

windows()
par(bg="white")
plot (subdata$x,subdata$Sub_metering_1,type="n", 		# sets the x and y axes scales, but no plotting!
xlab="",ylab="Energy sub metering") 				# adds titles to the axes
lines(subdata$x,subdata$Sub_metering_1,col="black")		# adds line for Sub1
lines(subdata$x,subdata$Sub_metering_2,col="red")		# adds line for Sub2
lines(subdata$x,subdata$Sub_metering_3,col="blue")		# adds line for Sub3
legend("topright", 							# places a legend at the appropriate place
c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),	# puts text in the legend
lty=c(1,1), 								# gives the legend appropriate symbols (lines)
col=c("black","red","blue"),						# gives the legend lines the correct color
cex=0.8)									# smaller legend
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
